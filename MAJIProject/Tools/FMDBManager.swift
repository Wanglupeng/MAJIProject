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
            "urlStr TEXT ,\n" +
            "timeStamp TEXT \n" +
        "); \n"
        
        // 执行SQL语句
        dbQueue!.inDatabase { (db) in
            db.executeUpdate(sql, withArgumentsIn: [])
        }
    }
    
    
    func insertDataToTable(datas: [HomeModel])  {
        if datas.count == 0 {return}
        FMDBManager.manager.dbQueue?.inTransaction({ (db, rollBack) in
            for item in datas {
                let sql = "INSERT INTO T_GitUrl (urlName,urlStr,timeStamp) VALUES ('\(item.urlName ?? "")','\(item.urlStr ?? "")','\(item.currentTime ?? "")')"
                let result = db.executeStatements(sql)
                print(result)
            }
        })
    }
    
    func readLeastedData(_ resultCallBack: (([HomeModel])->Void)?)  {
        FMDBManager.manager.dbQueue?.inTransaction({ (db, rollBack) in
//            select * from TABLENAME where tag=(select tag from TABLENAME order by id desc LIMIT 1)
          
            let sql = "SELECT * FROM T_GitUrl WHERE timeStamp=(SELECT timeStamp FROM T_GitUrl ORDER BY ID DESC LIMIT 1)"
            if let result = db.executeQuery(sql, withArgumentsIn: []) {
                var resultArray = [HomeModel]()
                
                while result.next() {
                    let keyStr = result.string(forColumn: "urlName") ?? ""
                    let valueStr = result.object(forColumn: "urlStr")
                    let timeStr = result.string(forColumn: "timeStamp") ?? ""
                    let model = HomeModel.init(key: keyStr, value: valueStr as AnyObject)
                    model.currentTime = timeStr
                    resultArray.append(model)
                }
                if resultArray.count > 0 {
                    resultCallBack?(resultArray)
                }
            }
        })
    }
    
    func readAllData(_ resultCallBack: (([HomeModel])->Void)?) {
        FMDBManager.manager.dbQueue?.inTransaction({ (db, rollBack) in
            //            select * from TABLENAME where tag=(select tag from TABLENAME order by id desc LIMIT 1)
            
            let sql = "SELECT * FROM T_GitUrl ORDER BY ID DESC"
            if let result = db.executeQuery(sql, withArgumentsIn: []) {
                var resultArray = [HomeModel]()
                while result.next() {
                    let keyStr = result.string(forColumn: "urlName") ?? ""
                    let valueStr = result.object(forColumn: "urlStr")
                    let timeStr = result.string(forColumn: "timeStamp") ?? ""
                    let model = HomeModel.init(key: keyStr, value: valueStr as AnyObject)
                    model.currentTime = timeStr
                    resultArray.append(model)
                }
                if resultArray.count > 0 {
                    resultCallBack?(resultArray)
                }
            }
        })
    }
    
    
}
