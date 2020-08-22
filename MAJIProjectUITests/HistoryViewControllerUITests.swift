//
//  HistoryViewControllerUITests.swift
//  MAJIProjectUITests
//
//  Created by Mac on 2020/8/22.
//  Copyright © 2020 Mac. All rights reserved.
//

import XCTest

class HistoryViewControllerUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testHistoryClicked() {
        let app = XCUIApplication()
        app.launch()
        if app.alerts.count > 0 {
            app.alerts.scrollViews.otherElements.buttons["ok"].tap()
        }
        app.navigationBars["MAJIProject.View"].buttons["History"].tap()
        let tablview = app.tables.element.firstMatch
        let start = tablview.coordinate(withNormalizedOffset: CGVector.init(dx: 0, dy: 0))
        let end = tablview.coordinate(withNormalizedOffset: CGVector.init(dx: 0, dy: 5))
        start.press(forDuration: 0.5, thenDragTo: end)

    }

}
