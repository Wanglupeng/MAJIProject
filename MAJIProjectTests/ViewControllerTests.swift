//
//  ViewControllerTests.swift
//  MAJIProjectTests
//
//  Created by Mac on 2020/8/22.
//  Copyright © 2020 Mac. All rights reserved.
//

import XCTest
@testable import MAJIProject
class ViewControllerTests: XCTestCase {

    var vc: ViewController?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vc = ViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        vc = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testinitTimer()  {
        vc?.initTimer()
        XCTAssertTrue(vc?.timer != nil)
    }
    func testhttpService() {
        vc?.httpService
        XCTAssertTrue(vc?.httpService != nil)
    }
    func testdataArray() {
          vc?.dataArray
          XCTAssertTrue(vc?.dataArray != nil)
      }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
