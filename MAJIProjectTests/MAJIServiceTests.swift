//
//  MAJIServiceTests.swift
//  MAJIProjectTests
//
//  Created by Mac on 2020/8/22.
//  Copyright © 2020 Mac. All rights reserved.
//

import XCTest
@testable import MAJIProject
class MAJIServiceTests: XCTestCase,MAJIServiceDelegate {
    var service:MAJIService?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        service = MAJIService.init(del: self)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        service = nil
    }
    func testresoveData(){
        let dic = ["k1":"v1","k2":"v2","k3":"v3"]
        var resultArray:[HomeModel]?
        resultArray = service?.resoveData(data: dic)
        XCTAssertEqual(resultArray?.count, 3, "解析错误")
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
