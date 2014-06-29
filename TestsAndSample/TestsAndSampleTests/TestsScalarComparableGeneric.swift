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
    XCTAssert(self.doubleValue == self.intValue);
    XCTAssert(self.doubleValue == self.cgFloatValue);
    XCTAssert(self.intValue == self.doubleValue);
    XCTAssert(self.intValue == self.cgFloatValue);

  }
  func testNotEqual() {
    XCTAssertFalse(self.cgFloatValue != self.doubleValue);
    XCTAssertFalse(self.cgFloatValue != self.intValue);
    XCTAssertFalse(self.doubleValue != self.intValue);
    XCTAssertFalse(self.doubleValue != self.cgFloatValue);
    XCTAssertFalse(self.intValue != self.doubleValue);
    XCTAssertFalse(self.intValue != self.cgFloatValue);
    
  }
  func testLessThanOrEqual() {
    XCTAssert(self.cgFloatValue <= self.doubleValue);
    XCTAssert(self.cgFloatValue <= self.intValue);
    XCTAssert(self.doubleValue <= self.intValue);
    XCTAssert(self.doubleValue <= self.cgFloatValue);
    XCTAssert(self.intValue <= self.doubleValue);
    XCTAssert(self.intValue <= self.cgFloatValue);
    
    self.cgFloatValue = -1
    XCTAssert(self.cgFloatValue <= self.doubleValue);
    XCTAssert(self.cgFloatValue <= self.intValue);
    
    self.doubleValue = -2
    XCTAssert(self.doubleValue <= self.intValue);
    XCTAssert(self.doubleValue <= self.cgFloatValue);

    self.intValue = -3
    XCTAssert(self.intValue <= self.doubleValue);
    XCTAssert(self.intValue <= self.cgFloatValue);


  }
  func testLessThan() {
    self.cgFloatValue = -1
    XCTAssert(self.cgFloatValue < self.doubleValue);
    XCTAssert(self.cgFloatValue < self.intValue);
    
    self.doubleValue = -2
    XCTAssert(self.doubleValue < self.intValue);
    XCTAssert(self.doubleValue < self.cgFloatValue);
    
    self.intValue = -3
    XCTAssert(self.intValue < self.doubleValue);
    XCTAssert(self.intValue < self.cgFloatValue);

  }
  func testGreaterThanOrEqual() {
    
  }
  func testGreaterThan() {
    
  }

}
