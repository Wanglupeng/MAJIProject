//
//  APPDefinition.swift
//  MAJIProject
//
//  Created by Peng on 2020/8/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
// NET
let RequestUrlDomain: String = "https://api.github.com/"

//UI
let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height

//DB
let DBName = "gitUrl.db"

//FUNCTION
func getCacheDir() -> String{
    return  NSHomeDirectory() + "/Library/Caches"
}

//获取时间戳
var timeStamp : String {
    let timeInterval: TimeInterval = Date.init().timeIntervalSince1970
    let timeStamp = Int(timeInterval)
    return "\(timeStamp)"
}

