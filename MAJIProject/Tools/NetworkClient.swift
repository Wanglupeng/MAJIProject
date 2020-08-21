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
 
    func requestWithAPI(Api: BaseRequestAPI , _ successResponse:((Any)->Void)?, _ errorResponse:((Error)->Void)?)  {
        var requestData: DataRequest?
        switch Api.APIMethod {
        case .Get:
            requestData = AF.request(Api.APIUrl, method: .get, parameters: Api.APIParams)
        case.Post:
            requestData = AF.request(Api.APIUrl, method: .post, parameters: Api.APIParams)
        default:
            //目前先不处理其他类型请求
            requestData = AF.request(Api.APIUrl, method: .post, parameters: Api.APIParams)
        }
        
        guard let request = requestData else {
            return
        }
       
        request.responseJSON { (responseObj) in
            switch responseObj.result {
            case .success(let json):
                successResponse?(json)
            case .failure(let errorData):
                if let error = errorData.underlyingError {
                    LLog(error.localizedDescription)
                    errorResponse?(error)
                }
            }
        }
    }
    
}




