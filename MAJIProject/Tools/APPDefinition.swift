//
//  APPDefinition.swift
//  MAJIProject
//
//  Created by Peng on 2020/8/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
// MARK: -NETWORK
//URLDomain
let RequestUrlDomain: String = "https://api.github.com"

//RequestMethon
public struct RequestMethod: RawRepresentable, Equatable, Hashable {
    public static let Get = RequestMethod(rawValue: "GET")
    public static let Post = RequestMethod(rawValue: "POST")
    public static let Put = RequestMethod(rawValue: "PUT")
    public static let Delete = RequestMethod(rawValue: "DELETE")
    public let rawValue: String
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
public let DefaultErrorMsg = "NETWORK ERROR "
public let DefaultSuccessMsg = "SUCCESSMSG"

// MARK: -UI
//UI
public let ScreenWidth = UIScreen.main.bounds.size.width
public let ScreenHeight = UIScreen.main.bounds.size.height
public let NAV_Height = UIApplication.shared.statusBarFrame.height + 44


// MARK: -DB
public let DBName = "gitUrl.db"

// MARK: -NOTIFICATION
public let ReceiveRefreshData = "ReceiveRefreshData"

// MARK: - Function
public func getCacheDir() -> String{
    return  NSHomeDirectory() + "/Library/Caches"
}

//get now timeStamp
public func getNowTimeStamp()-> String {
    let timeInterval: TimeInterval = Date.init().timeIntervalSince1970
    let timeStamp = Int(timeInterval)
    return "\(timeStamp)"
}

// timeStamp to string
public func timeStampToString(timeStamp: String,dataFormat: String)->String {
    let string = NSString(string: timeStamp)
    let timeSta:TimeInterval = string.doubleValue
    let dfmatter = DateFormatter()
    dfmatter.dateFormat = dataFormat
    let date = NSDate(timeIntervalSince1970: timeSta)
    return dfmatter.string(from: date as Date)
}

// 打印
public func LLog<T>(_ message: T,time:Date = Date(),fileName: String = #file, methodName: String =  #function, lineNumber: Int = #line){
    #if DEBUG
    let str : String = (fileName as NSString).pathComponents.last!.replacingOccurrences(of: "swift", with: "")
    print("\(time)  \(str)\(methodName)  [\(lineNumber)]:\(message)")
    #endif
}

