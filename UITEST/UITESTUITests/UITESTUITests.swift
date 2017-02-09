//
//  UITESTUITests.swift
//  UITESTUITests
//
//  Created by gyjrong on 17/1/23.
//  Copyright © 2017年 mythkiven. All rights reserved.
//

import XCTest

class UITESTUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
    }
    
    func testMyApp() {
        
        let app = XCUIApplication()
        let changecolorButton = app.buttons["changeColor"]
        changecolorButton.tap()
        
        // Jenkins Test
        changecolorButton.tap()
        
        app.buttons["下一页"].tap()
        app.buttons["back"].tap()
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
