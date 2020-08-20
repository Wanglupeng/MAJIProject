//
//  FMDBManager.swift
//  MAJIProject
//
//  Created by Peng on 2020/8/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class FMDBManager: NSObject {
    static let manager = FMDBManager()
    
    // 数据库的创建&表的创建
    var dbQueue: FMDatabaseQueue?
    func openDB(DBName: String) {
        let path = "\(getCacheDir())/\(DBName)"
        dbQueue = FMDatabaseQueue(path: path)
        createTable()
    }
    
    //  创建表
    func createTable() {
        // SQL语句
        let sql = "CREATE TABLE IF NOT EXISTS T_GitUrl( \n" +
            "id INTEGER PRIMARY KEY AUTOINCREMENT, \n" +
            "urlName TEXT, \n" +
            "urlStr TEXT \n" +
            "timeStamp TEXT \n" +
        "); \n"
        
        // 执行SQL语句
        dbQueue!.inDatabase { (db) in
            db.executeUpdate(sql, withArgumentsIn: [])
        }
    }
    
    func insertDataToTable(data: HomeModel)  {
        
    }
    
    
    
}
