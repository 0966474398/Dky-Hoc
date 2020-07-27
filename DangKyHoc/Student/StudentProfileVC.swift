//
//  StudentProfileVC.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 2/18/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire

class StudentProfileVC: UITableViewController {
    
    @IBOutlet weak var lbMaSV: UILabel!
    @IBOutlet weak var lbHoTen: UILabel!
    @IBOutlet weak var lbEmail: UILabel!
    @IBOutlet weak var lbGioiTinh: UILabel!
    @IBOutlet weak var lbNganh: UILabel!
    @IBOutlet weak var lbKhoa: UILabel!
    @IBOutlet weak var lbPhone: UILabel!
    
    var data: Student?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = data {
            fillData(data: data)
        } else {
            getProfile()
        }
        
    }
    
    func fillData(data: StudentModel) {
        lbMaSV.text = data.codeStudent
        lbHoTen.text = data.nameStudent
        lbEmail.text = data.emailStudent
        lbGioiTinh.text = data.genderStudent ? "nam" : "nu"
        lbNganh.text = data.facultyStudent
        lbKhoa.text = data.majorStudent
        lbPhone.text = data.phoneStudent
        tableView.reloadData()
    }
    
    func fillData(data: Student) {
        lbMaSV.text = data.codeStudent
        lbHoTen.text = data.nameStudent
        lbEmail.text = data.emailStudent
        lbGioiTinh.text = data.genderStudent ? "nam" : "nu"
        lbNganh.text = data.facultyStudent
        lbKhoa.text = data.majorStudent
        lbPhone.text = data.phoneStudent
        tableView.reloadData()
    }
    
    func getProfile() {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(MyUserDefaults.share.token!)",
            "Accept": "application/json",
            "Content-Type": "text/html; charset=utf-8"
        ]

        Alamofire.request("http://203.162.13.40:5000/me?user_type=student", headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                print(response.description)
                guard let data = Mapper<StudentModel>().map(JSONObject: response.result.value) else { return }
                if data.status == 200 {
                    self.fillData(data: data)
                } else {
                    self.show(title: "ERROR", message: data.msg)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.selectionStyle = .none
    }
    
    @IBAction func dangXuat() {
        navigationController?.popToRootViewController(animated: false)
    }
}
