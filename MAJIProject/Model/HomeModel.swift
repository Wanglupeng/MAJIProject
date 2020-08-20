//
//  HomeModel.swift
//  MAJIProject
//
//  Created by Peng on 2020/8/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import Alamofire

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
    
    /*
    func insertPerson() {
        
//        assert(name != nil, "必须要给name赋值")
        
        // 1、编写SQLite语句
        let sql = "INSERT INTO T_Person6 (name,age) VALUES ('\(name!)',\(age));"
        // 2、执行SQLite语句
        /** 只要在inTransaction闭包中执行的语句都是已经开启的事务
            第一个参数：已经打开了的数据库对象
            第二个参数：用于是否需要回滚数据
         */
        JKSQLiteManger.shareManger().dbQueue?.inTransaction({ (db, rollback) in

            // 如果插入数据失败就回滚
            /*
               OC中的写法   ：*rollback = YES
               Swift中的写法：rollback.pointee = true (rollback.memory = true 废弃)
             */
            if !db.executeUpdate(sql, withArgumentsIn: [])
            {
                 rollback.pointee = true
            }else{
                
            }
            
        })
    }
 */
}
