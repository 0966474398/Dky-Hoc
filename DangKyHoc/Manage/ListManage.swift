//
//  ListSubjectsManageVC.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 2/18/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class ListManage: UITableViewController {
    
    var manage: Manage?
    var listStudent: [Student] = []
    var listTeacher: [Teacher] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        callAPI()
    }
    
    func getURL() -> String {
        switch manage! {
        case .listStudent: return "http://203.162.13.40:5000/student?start=1&limit=100"
        case .listTeacher: return "http://203.162.13.40:5000/teacher?start=1&limit=100"
        case .listSubjects: return ""
        }
    }
    
    func mapping(data: Any?) {
        switch manage! {
        case .listStudent:
            guard let data = Mapper<ListSV>().map(JSONObject: data) else { return }
            guard data.status == 200 else {
                 self.show(title: "ERROR", message: data.msg)
                 return
             }
             self.listStudent = data.students!
        case .listTeacher:
            guard let data = Mapper<ListTeacher>().map(JSONObject: data) else { return }
            guard data.status == 200 else {
                self.show(title: "ERROR", message: data.msg)
                return
            }
            self.listTeacher = data.teachers!
        case .listSubjects: break
        }
         
        
        tableView.reloadData()
    }
    
    func callAPI() {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(MyUserDefaults.share.token!)",
            "Accept": "application/json",
            "Content-Type": "text/html; charset=utf-8"
        ]

        Alamofire.request(getURL(), headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                print(response.description)
                self.mapping(data: response.result.value)
            case .failure(let error):
                print(error)
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch manage! {
        case .listStudent: return listStudent.count
        case .listTeacher: return listTeacher.count
        case .listSubjects: return 0
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        switch manage! {
        case .listStudent: cell.textLabel?.text = listStudent[indexPath.row].nameStudent
        case .listTeacher:
            cell.selectionStyle = .none
            cell.textLabel?.text = listTeacher[indexPath.row].name
        case .listSubjects: break
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch manage! {
        case .listStudent:
            let storyboard = UIStoryboard(name: "ManageView", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "ScoreViewcontrollerViewController") as? ScoreViewcontrollerViewController
            vc?.studentID = listStudent.first?.id
            self.navigationController?.pushViewController(vc!, animated: false)
        case .listTeacher: break
        case .listSubjects: break
        }
        
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
