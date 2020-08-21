//
//  HistoryViewController.swift
//  MAJIProjectTests
//
//  Created by Peng on 2020/8/21.
//  Copyright © 2020 Mac. All rights reserved.
//

import XCTest
@testable import MAJIProject
class HistoryViewController: XCTestCase {

    var vc: HistoryViewController?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vc = HistoryViewController.init()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        vc = nil
    }

    func testreceiveData()  {
        
//        vc?.testreceiveData()
        vc?.testcreateReceiveDataLabel()
    }
    
    func testrefreshData()  {
        print("213")
    }
    
    func testcreateReceiveDataLabel() {
        
    }
    
    func testaddHeadRefresh()  {
        
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
