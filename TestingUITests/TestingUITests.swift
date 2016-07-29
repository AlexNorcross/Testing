//
//  TestingUITests.swift
//  TestingUITests
//
//  Created by Alexandra Norcross on 6/10/16.
//  Copyright © 2016 Alexandra Norcross. All rights reserved.
//

import XCTest

class TestingUITests: XCTestCase {
        
  override func setUp() {
    super.setUp()
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    XCUIApplication().launch()

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  
  func testUpdatePercentageLabel() {
    
    let app = XCUIApplication()
    
    let sliderPercentage = app.sliders["50%"]
    sliderPercentage.tap()
    sliderPercentage.adjustToNormalizedSliderPosition(0.67)
    
    XCTAssert(app.staticTexts["@ 20%"].exists)
  }
  
  func testComputeAlertError() {
    
    let app = XCUIApplication()
    
    app.buttons["compute tip"].tap()
    
    expectationForPredicate(NSPredicate(format: "exists == 1"), evaluatedWithObject: app.alerts["oops"], handler: nil)
    waitForExpectationsWithTimeout(5, handler: nil)
    
    let alertOops = app.alerts["oops"]
    alertOops.collectionViews.buttons["OK"].tap()
    XCTAssertFalse(alertOops.exists)
  }
  
  func testComputeAlert() {
    
    let app = XCUIApplication()
    
    let textFieldCost = app.textFields["meal total"]
    textFieldCost.tap()
    textFieldCost.typeText("100")
    
    app.buttons["compute tip"].tap()

    expectationForPredicate(NSPredicate(format: "exists == 1"), evaluatedWithObject: app.alerts["tip"], handler: nil)
    waitForExpectationsWithTimeout(5, handler: nil)

    let alertTip = app.alerts["tip"]
    XCTAssert(alertTip.exists)
    alertTip.collectionViews.buttons["OK"].tap()
    XCTAssertFalse(alertTip.exists)
  }
}