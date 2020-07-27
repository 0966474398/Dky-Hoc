//
//  TKBCell.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 3/6/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import UIKit

class TKBCell: UITableViewCell {
    @IBOutlet weak var lbcodeTeacher: UILabel!
    @IBOutlet weak var lbNameTeacher: UILabel!
    @IBOutlet weak var lbNameRoom: UILabel!
    @IBOutlet weak var lbIDClass: UILabel!
    @IBOutlet weak var lbNameClass: UILabel!
    @IBOutlet weak var lbStartTime: UILabel!
    @IBOutlet weak var lbEndTime: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDay: UILabel!
    @IBOutlet weak var lbCreditSubject: UILabel!
    @IBOutlet weak var lbCodeSubject: UILabel!
    @IBOutlet weak var lbNameSubject: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
