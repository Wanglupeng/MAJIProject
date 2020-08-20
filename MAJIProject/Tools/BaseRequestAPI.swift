//
//  BaseRequestAPI.swift
//  MAJIProject
//
//  Created by Peng on 2020/8/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import Alamofire

class BaseRequestAPI: NSObject {
    var APIUrl: String = ""
    var APIParams: [String: Any]?
    var APIMethod: HTTPMethod = .get
}
