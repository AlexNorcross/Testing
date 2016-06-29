//
//  TestingTests.swift
//  TestingTests
//
//  Created by Alexandra Norcross on 6/10/16.
//  Copyright © 2016 Alexandra Norcross. All rights reserved.
//

import XCTest
@testable import Testing

class TestingTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    
  }
    
  override func tearDown() {
    
    super.tearDown()
  }
  
  
  //MARK: Meal
  
  func testTip() {
    
    let eat = Meal(cost: 100, tipPercent: 10)
    
    XCTAssertEqual(eat.tip, 10)
    XCTAssertNotEqual(eat.tip, 15)
  }
  
  
  //MARK: Float Extension
  
  func testCurrencyFormat() {
    
    XCTAssertEqual(Float(100.1).currencyFormat, "$100.10")
    XCTAssertNotEqual(Float(100.1).currencyFormat, "100.10")
    XCTAssertNotEqual(Float(100.1).currencyFormat, "$100.1")
  }
  
  
  //MARK: String Extension
  
  func testValidateCurrencyValue() {
    
    XCTAssertFalse("".validateCurrencyValue)
    XCTAssertTrue("1".validateCurrencyValue)
    
    XCTAssert("s".validateCurrencyValue == false)
    XCTAssert("1.2".validateCurrencyValue == true)
    XCTAssert("1000.25".validateCurrencyValue == true)
    XCTAssert("100.123".validateCurrencyValue == false)
  }
  
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measureBlock {
      // Put the code you want to measure the time of here.
    }
  }
}