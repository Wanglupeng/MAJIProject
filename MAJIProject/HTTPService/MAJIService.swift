//
//  MAJIService.swift
//  MAJIProject
//
//  Created by Peng on 2020/8/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

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
        api.APIMethod = .Get
        api.APIParams = nil
        api.APIUrl = RequestUrlDomain
        NetworkClient.manager.requestWithAPI(Api: api, { (successData) in
            let _ = self.resoveData(data: successData)
        }) { (errorData) in
            self.delegate?.requestHomeDataResponse?(isSuc: false, message: DefaultErrorMsg, successData: nil)
        }
    }
    
    //解析数据
    func resoveData(data: Any) ->[HomeModel]?{
        var resultArray = [HomeModel]()
        if let data = data as? Dictionary<String,AnyObject> {
            let time = getNowTimeStamp()
            for item in data {
                let model = HomeModel.init(key: item.key, value: item.value)
                model.currentTime = time
                if item.key.contains("documentation_url") || item.key.contains("message") {
                    return nil
                }
                resultArray.append(model)
            }
        }
        //Save to db
        FMDBManager.manager.insertDataToTable(datas: resultArray)
        self.delegate?.requestHomeDataResponse?(isSuc: true, message: DefaultSuccessMsg, successData: resultArray)
        return resultArray
    }
}
