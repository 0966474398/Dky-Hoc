//
//  ListClassVC.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 2/18/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import UIKit

class ListClassVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    lazy var listClass: [SubjectModel] = {
        return [SubjectModel(tenMH: "Mon hoc 1", maMH: "AAAA"),
                SubjectModel(tenMH: "Mon hoc 2", maMH: "BBBB"),
                SubjectModel(tenMH: "Mon hoc 3", maMH: "CCCC")]
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listClass.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ListClass")
        let subject = listClass[indexPath.row]
        cell.textLabel?.text = subject.tenMH
        cell.detailTextLabel?.text = subject.maMH
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.selectionStyle = .none
        let storyboard = UIStoryboard(name: "TeacherView", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "DetailsClass")
        navigationController?.pushViewController(vc, animated: true)
    }

}
