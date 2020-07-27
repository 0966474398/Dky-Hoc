//
//  SelectedTypeLoginVC.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 1/16/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import UIKit

extension UIView {
    func setupShadowAndRadius(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.5
        self.clipsToBounds = true
        self.layer.masksToBounds = false
    }
}

class SelectedTypeLoginVC: UIViewController {
    
    @IBOutlet var btnSelected: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSelected.forEach {
            $0.setupShadowAndRadius(cornerRadius: 10)
        }
//        
//        for item in btnSelected {
//            item.setupShadowAndRadius(cornerRadius: 10)
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func showManage() {
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let loginVC = segue.destination as? LoginViewController else { return }
        switch segue.identifier ?? "" {
        case LoginType.student.rawValue:
            loginVC.typeLogin = LoginType.student
        case LoginType.teacher.rawValue:
            loginVC.typeLogin = LoginType.teacher
        case "manage":
            loginVC.typeLogin = LoginType.teacher
            loginVC.isManage = true
        default: break
        }
    }

}
