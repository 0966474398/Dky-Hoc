//
//  ListSV.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 2/26/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import Foundation
import ObjectMapper

class ListSV: Mappable, Message {
    var msg: String = ""
    var status: Int = 0
    var students: [Student]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        msg <- map["msg"]
        students <- map["data.student"]
    }
}

class Student: Mappable {
    var nameStudent = ""
    var codeStudent = ""
    var emailStudent = ""
    var facultyStudent = ""
    var genderStudent: Bool = false
    var majorStudent = ""
    var phoneStudent = ""
    var id = ""
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        nameStudent <- map["name"]
        codeStudent <- map["code"]
        emailStudent <- map["email"]
        facultyStudent <- map["faculty"]
        genderStudent <- map["gender"]
        majorStudent <- map["major"]
        phoneStudent <- map["phone"]
        id <- map["id"]
    }
}
