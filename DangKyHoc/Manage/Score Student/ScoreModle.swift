//
//  ScoreModle.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 3/5/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import Foundation
import ObjectMapper
class ScoreModle: Mappable, Message {
   var msg: String = ""
    var status: Int = 0
    var score: [Score]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        msg <- map["msg"]
        score <- map["data.score"]
    }
}
class Score: Mappable {
    var score = 0
    var code = ""
    var credit = 0
    var factor = 0
    var id = 0
    var name = ""
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        score <- map["score"]
        code <- map["subject.code"]
        credit <- map["subject.credit"]
        factor <- map["subject.factor"]
        id <- map["subject.id"]
        name <- map["subject.name"]
        
    }
    
}
