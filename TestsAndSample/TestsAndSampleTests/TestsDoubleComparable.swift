//
//  TestsDoubleComparable.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 01/07/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import XCTest

class TestsDoubleComparable: SuperTestsScalarComparable, ScalarComparableTesting {

  func testEqual() {
    XCTAssert(self.doubleValue == self.intValue);
    XCTAssert(self.doubleValue == self.cgFloatValue);
    
  }
  func testNotEqual() {
    XCTAssertFalse(self.doubleValue != self.intValue);
    XCTAssertFalse(self.doubleValue != self.cgFloatValue);
    
  }
  func testLessThanOrEqual() {
    XCTAssert(self.doubleValue <= self.intValue);
    XCTAssert(self.doubleValue <= self.cgFloatValue);

    self.doubleValue = -1
    XCTAssert(self.doubleValue <= self.intValue);
    XCTAssert(self.doubleValue <= self.cgFloatValue);
    
    
    
  }
  func testLessThan() {
    self.doubleValue = -1
    XCTAssert(self.doubleValue < self.intValue);
    XCTAssert(self.doubleValue < self.cgFloatValue);
    
  }
  
  func testGreaterThanOrEqual() {
    
    XCTAssert(self.doubleValue >= self.intValue);
    XCTAssert(self.doubleValue >= self.cgFloatValue);
    
    self.doubleValue = -1
    XCTAssertFalse(self.doubleValue >= self.intValue);
    XCTAssertFalse(self.doubleValue >= self.cgFloatValue);
  }
  
  func testGreaterThan() {
    
    self.doubleValue = -1
    XCTAssertFalse(self.doubleValue > self.intValue);
    XCTAssertFalse(self.doubleValue > self.cgFloatValue);
    
    
  }
}
