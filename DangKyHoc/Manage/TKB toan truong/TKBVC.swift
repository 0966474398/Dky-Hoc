//
//  TKBViewControllerCollectionViewController.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 3/5/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class TKBVC: UITableViewController {
    
    var semesterID = ""
    
    var listSemester: [Tkb]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Semester Subclass"
        let url = "http://203.162.13.40:5000/semester/\(semesterID)/subclass?start=1&limit=10"
        APICLient.share.request(viewController: self, url: url) { [weak self] (data: TkbModle) in
            self?.listSemester = data.tkb
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "TKBCell",for: indexPath) as! TKBCell
        let TKB = listSemester?[indexPath.row]
        cell.lbcodeTeacher.text = TKB?.codeTeacher
        cell.lbNameTeacher.text = TKB?.nameTeacher
        cell.lbNameRoom.text = TKB?.nameRoom
        cell.lbIDClass.text = TKB?.idClass
        cell.lbNameClass.text = TKB?.nameClass
        cell.lbStartTime.text = TKB?.startTime
        cell.lbEndTime.text = TKB?.endTime
        cell.lbName.text = TKB?.name
        cell.lbDay.text = "\(TKB!.day))"
        cell.lbCreditSubject.text = "\(TKB!.creditSubject)"
        cell.lbNameSubject.text = TKB?.nameSubject
        cell.lbCodeSubject.text = TKB?.codeSubject
        return cell
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 630
    }
    
    
}
