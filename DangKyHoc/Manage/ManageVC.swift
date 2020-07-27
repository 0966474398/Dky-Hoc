//
//  ManageVCTableViewController.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 2/18/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import UIKit

enum Manage: String {
    case listStudent = "DS1"
    case listTeacher = "DS2"
    case listSubjects = "DS3"
}

class ManageVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true);
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifi = segue.identifier, let vc = segue.destination as? ListManage {
            switch identifi {
            case Manage.listSubjects.rawValue:
                vc.manage = Manage.listSubjects
            case Manage.listStudent.rawValue:
                vc.manage = Manage.listStudent
            case Manage.listTeacher.rawValue:
                vc.manage = Manage.listTeacher
            default: break
            }
        }
    }

    
    @IBAction func logout() {
        navigationController?.popToRootViewController(animated: true)
    }
}
