//
//  HomeModel.swift
//  MAJIProject
//
//  Created by Peng on 2020/8/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit


class HomeModel: NSObject {
    var urlName:String?
    var urlStr: String?
    var currentTime: String?
    
    init(key: String, value: AnyObject) {
        urlName = key
        if let url = value as? String {
            urlStr = url
        }
    }
}
