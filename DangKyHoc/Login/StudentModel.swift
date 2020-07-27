//
//  LoginModel1.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 1/16/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import ObjectMapper

protocol Message {
    var msg: String { get set }
    var status: Int { get set }
    
}

protocol Token {
    var accessToken: String { get set }
}

class LoginStudentModel: NSObject, Mappable, Message, Token {
    
    var accessToken = ""
    var nameStudent = ""
    var codeStudent = ""
    var emailStudent = ""
    var facultyStudent = ""
    var genderStudent: Bool = false
    var majorStudent = ""
    var phoneStudent = ""
    var msg: String = ""
    var status = 0
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        accessToken <- map["access_token"]
        nameStudent <- map["student.name"]
        codeStudent <- map["student.code"]
        emailStudent <- map["student.email"]
        status <- map["status"]
        facultyStudent <- map["student.faculty"]
        genderStudent <- map["student.gender"]
        majorStudent <- map["student.major"]
        phoneStudent <- map["student.phone"]
        msg <- map["msg"]
    }
}

class StudentModel: NSObject, Mappable, Message {

    var nameStudent = ""
    var codeStudent = ""
    var emailStudent = ""
    var facultyStudent = ""
    var genderStudent: Bool = false
    var majorStudent = ""
    var phoneStudent = ""
    var msg: String = ""
    var status = 0
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        nameStudent <- map["data.student.name"]
        codeStudent <- map["data.student.code"]
        emailStudent <- map["data.student.email"]
        status <- map["status"]
        facultyStudent <- map["data.student.faculty"]
        genderStudent <- map["data.student.gender"]
        majorStudent <- map["data.student.major"]
        phoneStudent <- map["data.student.phone"]
        msg <- map["msg"]
    }
}
