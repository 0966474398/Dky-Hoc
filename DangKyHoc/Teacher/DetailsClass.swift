//
//  DetailsClass.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 2/18/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import UIKit

class DetailsClass: UITableViewController {
    
    @IBOutlet weak var lbThu: UILabel!
    @IBOutlet weak var lbCahoc: UILabel!
    @IBOutlet weak var lbPhongHoc: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
//        lbThu.text =
//        lbCahoc.text =
//        lbPhongHoc.text =
    }
    
    @IBAction func danhSachSV() {
        let storyboard = UIStoryboard(name: "TeacherView", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "ListStudentVC")
        navigationController?.pushViewController(vc, animated: true)
    }
}
