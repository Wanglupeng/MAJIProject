//
//  NetworkClient.swift
//  MAJIProject
//
//  Created by Peng on 2020/8/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import Alamofire

class NetworkClient: NSObject {
    static let manager = NetworkClient()
 
    func requestWithAPI(Api: BaseRequestAPI , _ successData:((Any)->Void)?, _ errorData:((AFError)->Void)?)  {
        AF.request(Api.APIUrl, method: Api.APIMethod, parameters: Api.APIParams).responseJSON { (responseObj) in
            switch responseObj.result {
            case .success(let json):
                successData?(json)
                break
            case .failure(let error):
                errorData?(error)
                break
            }
        }
    }
    
    func jsonToDIc()  {
        
    }
}




