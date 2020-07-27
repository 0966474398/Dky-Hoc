//
//  ListTeacher.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 2/26/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import Foundation
import ObjectMapper

class ListTeacher: Mappable, Message {
    var msg: String = ""
    var status: Int = 0
    var teachers: [Teacher]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        msg <- map["msg"]
        teachers <- map["data.teacher"]
    }
}

class Teacher: Mappable {
    var name = ""
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        name <- map["name"]
    }
}
