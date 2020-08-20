//
//  MAJIService.swift
//  MAJIProject
//
//  Created by Peng on 2020/8/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import Alamofire

@objc protocol MAJIServiceDelegate: NSObjectProtocol {
    @objc optional func requestHomeDataResponse(isSuc: Bool, message: String ,successData: [HomeModel]?)
}

class MAJIService: NSObject {
    fileprivate var delegate: MAJIServiceDelegate?
    init(del:MAJIServiceDelegate) {
        delegate = del
    }
    
    func requestHomeData()  {
        let api = BaseRequestAPI()
        api.APIMethod = .get
        api.APIParams = nil
        api.APIUrl = RequestUrlDomain
        NetworkClient.manager.requestWithAPI(Api: api, { (successData) in
        }) { (errorData) in
            self.delegate?.requestHomeDataResponse?(isSuc: false, message: "NET ERROR", successData: nil)
        }
    }
    
    //解析数据
    private func resoveData(data: Any)  {
        var resultArray = [HomeModel]()
        if let data = data as? Dictionary<String,AnyObject> {
            for item in data {
                let model = HomeModel.init(key: item.key, value: item.value)
                resultArray.append(model)
            }
        }
        self.delegate?.requestHomeDataResponse?(isSuc: true, message: "SUCCESS", successData: resultArray)
    }
}
