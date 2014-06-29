//
//  TestsScalarComparable.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 29/06/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import XCTest
import CoreGraphics

class TestsScalarComparableGeneric: SuperTestsScalarFunctions {
  var cgFloatValue  = CGFloat(2.0)
  var doubleValue = Double(2.0)
  var intValue      = 2

  func testEqual() {
    XCTAssert(self.cgFloatValue == self.doubleValue);
    XCTAssert(self.cgFloatValue == self.intValue);
    XCTAssert(self.doubleValue == self.doubleValue);
    XCTAssert(self.intValue == self.doubleValue);
    XCTAssert(self.doubleValue == self.intValue);
    XCTAssert(self.intValue == self.doubleValue);
  }
  func testNotEqual() {
    XCTAssertFalse(self.cgFloatValue != self.doubleValue);
    XCTAssertFalse(self.cgFloatValue != self.intValue);
    XCTAssertFalse(self.doubleValue != self.doubleValue);
    XCTAssertFalse(self.intValue != self.doubleValue);
    XCTAssertFalse(self.doubleValue != self.intValue);
    XCTAssertFalse(self.intValue != self.doubleValue);
    
  }
  func testLessThanOrEqual() {
    
  }
  func testLessThan() {
    
  }
  func testGreaterThanOrEqual() {
    
  }
  func testGreaterThan() {
    
  }

}
