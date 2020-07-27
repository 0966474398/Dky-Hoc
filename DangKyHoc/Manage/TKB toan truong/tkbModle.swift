//
//  tkbModle.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 3/5/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//
//
import Foundation
import ObjectMapper
class TkbModle: Mappable, Message {
   var msg: String = ""
    var status: Int = 0
    var tkb: [Tkb]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        msg <- map["msg"]
        tkb <- map["data"]
    }
}
class Tkb: Mappable{
    
    var codeTeacher = ""
    var nameTeacher = ""
    var nameRoom = ""
    var idClass = ""
    var nameClass = ""
    var startTime = ""
    var endTime = ""
    var name = ""
    var day = 0
    var creditSubject = 0
    var codeSubject = ""
    var nameSubject = ""
    required init?(map: Map) {
    }

    func mapping(map: Map) {
        codeTeacher <- map["teacher.code"]
        nameTeacher <- map["teacher.name"]
        nameRoom <- map["room.name"]
        idClass <- map["class.id"]
        nameClass <- map["class.name"]
        startTime <- map["subclass.shift.start"]
        endTime <- map["subclass.shift.end"]
        name <- map["data.name"]
        day <- map["data.day"]
        creditSubject <- map["subject.credit"]
        codeSubject <- map["subject.code"]
        nameSubject <- map["subject.name"]

    }
    
}
