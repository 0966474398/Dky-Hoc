//
//  ListSubjectVC.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 2/18/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import UIKit

class SubjectModel {
    var tenMH: String
    var maMH: String
    
    init(tenMH: String, maMH: String) {
        self.tenMH = tenMH
        self.maMH = maMH
    }
}

class ListSubjectVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    lazy var listSubjects: [SubjectModel] = {
        return [SubjectModel(tenMH: "Mon hoc 1", maMH: "AAAA"),
                SubjectModel(tenMH: "Mon hoc 2", maMH: "BBBB"),
                SubjectModel(tenMH: "Mon hoc 3", maMH: "CCCC")]
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listSubjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        let subject = listSubjects[indexPath.row]
        cell.textLabel?.text = subject.tenMH
        cell.detailTextLabel?.text = subject.maMH
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.selectionStyle = .none
        let storyboard = UIStoryboard(name: "Student", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "DetailSubjectVC")
        navigationController?.pushViewController(vc, animated: true)
    }
}
