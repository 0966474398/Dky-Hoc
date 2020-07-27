//
//  GroupModel.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 3/5/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import Foundation

import ObjectMapper

class GroupModel: Mappable, Message {
   var msg: String = ""
    var status: Int = 0
    var group: [Group]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        msg <- map["msg"]
        group <- map["data.group"]
    }
}
class Group: Mappable {
    var id = ""
    var name = ""
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        
    }
    
}
