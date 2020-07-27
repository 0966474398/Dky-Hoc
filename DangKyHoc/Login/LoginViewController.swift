//
//  ViewController.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 1/15/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

enum LoginType: String {
    case student = "student"
    case teacher = "teacher"
    
    func callAPILogin<T: Mappable>(code: String, pass: String, compile: @escaping ((T?)->Void)) {
        let url = URL(string: "http://203.162.13.40:5000/login/\(self.rawValue)")!
        let parameters = ["code": code, "password": pass]
        Alamofire.request(url, method: .post, parameters: parameters,encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success:
                print(response.description)
                let model = Mapper<T>().map(JSONObject: response.result.value)
                compile(model)
            case .failure(let error):
                print(error)
            }
        }
    }
}

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tfCode: UITextField!
    @IBOutlet weak var tfPass: UITextField!
    @IBOutlet weak var imgLogo: UIImageView!
    
    var typeLogin: LoginType?
    var isManage = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tfCode.text = "MDL001"
//        tfPass.text = "123456"
        
        [tfCode, tfPass].forEach {
            $0.delegate = self
        }
        
        title = "Login"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLayoutSubviews() {
        imgLogo.setupShadowAndRadius(cornerRadius: imgLogo.frame.width/2)
    }
    
    @IBAction func tappedLogin() {
        let code = tfCode.text!
        let pass = tfPass.text!
        if code.isEmpty || pass.isEmpty {
            show(title: "Error", message: "Code or Password can not empty.!")
            return
        }
        
        guard let type = typeLogin else { return }
        switch type {
        case .student:
            type.callAPILogin(code: code, pass: pass) { [weak self] (model: LoginStudentModel?) in
                self?.handleResponse(data: model)
            }
        case .teacher:
            type.callAPILogin(code: code, pass: pass) { [weak self] (model: LoginModel?) in
                self?.handleResponse(data: model)
            }
        }
    }
    
    func handleResponse<T: Mappable & Message & Token>(data: T?) {
        guard let data = data else { return }
        switch data.status {
        case 200:
            MyUserDefaults.share.token = data.accessToken
            guard let type = typeLogin else { return }
            switch type {
            case .student:
                let storyboard = UIStoryboard(name: "Student", bundle: nil)
                let vc = storyboard.instantiateInitialViewController()
                self.navigationController?.pushViewController(vc!, animated: false)
            case .teacher:
                if self.isManage {
                    let storyboard = UIStoryboard(name: "ManageView", bundle: nil)
                    let vc = storyboard.instantiateInitialViewController()
                    self.navigationController?.pushViewController(vc!, animated: false)
                } else {
                    let storyboard = UIStoryboard(name: "TeacherView", bundle: nil)
                    let vc = storyboard.instantiateInitialViewController()
                    self.navigationController?.pushViewController(vc!, animated: false)
                }
            }
        case 401:show(title: "Error", message: data.msg)
        default: break
        }
    }
}
 

extension UIViewController {
    func show(title: String? = nil, message: String? = nil) {
        let alertControl = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { [weak self] (data) in
            self?.dismiss(animated: true, completion: nil)
        }
        alertControl.addAction(cancel)
        present(alertControl, animated: true, completion: nil)
    }
}
