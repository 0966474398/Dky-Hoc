//
//  ScoreCell.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 3/5/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import UIKit

class ScoreCell: UITableViewCell {
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var lbCredit: UILabel!
    @IBOutlet weak var lbCode: UILabel!
    @IBOutlet weak var lbID: UILabel!
    @IBOutlet weak var lbFactor: UILabel!
    @IBOutlet weak var lbName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
