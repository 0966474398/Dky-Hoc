//
//  GroupSemesterTableViewController.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 3/5/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import UIKit

class GroupSemesterVC: UITableViewController {

    var groupID: String = ""
    
    var listSemester: [Semester]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Group Semester"
        let url = "http://203.162.13.40:5000/group/\(groupID)/semester?start=1&limit=100"
        APICLient.share.request(viewController: self, url: url) { [weak self] (data: GroupSemesterModel) in
            self?.listSemester = data.semester
            self?.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listSemester?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = listSemester?[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "ManageView", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "TKBVC") as? TKBVC
        vc?.semesterID = listSemester?[indexPath.row].id ?? ""
        self.navigationController?.pushViewController(vc!, animated: false)
    }

}
