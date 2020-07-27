//
//  APIClient.swift
//  DangKyHoc
//
//  Created by Nguyen Quoc Dich on 3/5/20.
//  Copyright © 2020 Nguyen.Quoc.Dich. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class APICLient {
    
    static var share = APICLient()
    
    private init(){}
    
    func request<D: BaseMappable & Message>(viewController: UIViewController, url: String, completed: @escaping ((D)->Void)) {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(MyUserDefaults.share.token!)",
            "Accept": "application/json",
            "Content-Type": "text/html; charset=utf-8"
        ]
        
        Alamofire.request(url, headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                print(response.description)
                guard let data = Mapper<D>().map(JSONObject: response.result.value) else { return }
                guard data.status == 200 else {
                    
                    viewController.show(title: "ERROR", message: data.msg)
                    return
                }
                completed(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
