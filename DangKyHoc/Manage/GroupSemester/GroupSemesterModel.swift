//
//  GroupSemesterModel.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 3/5/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import Foundation
import ObjectMapper

class GroupSemesterModel: Mappable, Message {
   var msg: String = ""
    var status: Int = 0
    var semester: [Semester]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        msg <- map["msg"]
        semester <- map["data.semester"]
    }
}
class Semester: Mappable {
    var start = ""
    var year = 0
    var end = ""
    var id = ""
    var name = ""
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        start <- map["start"]
        year <- map["year"]
        id <- map["id"]
        name <- map["name"]
        end <- map["end"]
    }
    
}
