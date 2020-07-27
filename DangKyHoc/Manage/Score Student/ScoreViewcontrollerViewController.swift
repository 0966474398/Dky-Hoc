//
//  ScoreViewcontrollerViewController.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 3/5/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class ScoreViewcontrollerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var studentID: String?
    var listScore: [Score] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let url = "http://203.162.13.40:5000/student/\(studentID!)/score?start=1&limit=100"
        APICLient.share.request(viewController: self, url: url) { [weak self] (data: ScoreModle) in
            self?.listScore = data.score!
            self?.tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listScore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreCell", for: indexPath) as! ScoreCell
        let score = listScore[indexPath.row]
        cell.lbCode.text = score.code
        cell.lbCredit.text = " \(score.credit)"
        cell.lbFactor.text = "\(score.factor)"
        cell.lbID.text = "\(score.id)"
        cell.lbName.text = score.name
        cell.lbScore.text = "\(score.score)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 245
    }

}
