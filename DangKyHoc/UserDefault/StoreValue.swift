//
//  StoreValue.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 1/15/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import Foundation

class MyUserDefaults {
    
    static let share = MyUserDefaults()
    private init() {}
    
    private static var keyToken = "token"
    
    var token: String? {
        get {
            return UserDefaults.standard.value(forKey: MyUserDefaults.keyToken) as? String
        }
        set {
            if newValue == nil {
                UserDefaults.standard.removeObject(forKey: MyUserDefaults.keyToken)
            } else {
                UserDefaults.standard.set(newValue!, forKey: MyUserDefaults.keyToken)
            }
        }
    }
    
}
