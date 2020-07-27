//
//  LoginModel.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 1/15/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import ObjectMapper

class LoginModel: NSObject, Mappable, Message, Token {
    
    var accessToken = ""
    var nameTeacher = ""
    var codeTeacher = ""
    var msg = ""
    var status = 0
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        accessToken <- map["access_token"]
        nameTeacher <- map["teacher.name"]
        codeTeacher <- map["teacher.code"] 
        status <- map["status"]
        msg <- map["msg"]
    }
}

