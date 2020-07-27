//
//  DetailSubjectVC.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 2/18/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import UIKit

class DetailSubjectVC: UITableViewController {
    
    @IBOutlet weak var lbThu: UILabel!
    @IBOutlet weak var lbCaHoc: UILabel!
    @IBOutlet weak var lbPhongHoc: UILabel!
    @IBOutlet weak var lbGiaoVien: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
//        lbThu.text =
//        lbCaHoc.text =
//        lbPhongHoc.text =
//        lbGiaoVien.text =
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.selectionStyle = .none
    }
}
