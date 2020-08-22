//
//  HistoryViewControllerTests.swift
//  MAJIProjectTests
//
//  Created by Mac on 2020/8/22.
//  Copyright © 2020 Mac. All rights reserved.
//

import XCTest
@testable import MAJIProject
class HistoryViewControllerTests: XCTestCase {
    var vc: HistoryViewController?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vc = HistoryViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        vc = nil
    }
  
    func testcreateReceiveDataLabel()  {
        vc?.createReceiveDataLabel()
        let view = vc?.tableView.tableHeaderView
        XCTAssertTrue(view != nil)
    }
    func testaddHeadRefresh() {
        vc?.addHeadRefresh()
        let view = vc?.tableView.mj_header
        XCTAssertTrue(view != nil)
    }
  
    func testreceiveData()  {
        let count = vc?.receiveDataCount ?? 0
        vc?.receiveData()
        XCTAssertEqual(vc?.receiveDataCount, count+1, "收到数据")
    }
    func testresoveSqlData() {
        self.resoveSql()
        XCTAssertEqual(vc?.dataArray.count, 2, "分组错误")
    }
    func resoveSql() {
        let model1 = HomeModel.init(key: "1", value: "1" as AnyObject)
        model1.currentTime = "1"
        let model2 = HomeModel.init(key: "2", value: "2" as AnyObject)
        model2.currentTime = "2"
        let datas = [model1,model2]
        vc?.resoveSqlData(datas: datas)
    }
    
    func testPerformanceresoveSqlData() {
        self.measure {
            resoveSql()
        }
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
