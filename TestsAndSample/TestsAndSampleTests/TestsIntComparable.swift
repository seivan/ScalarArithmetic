//
//  TestsIntComparable.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 01/07/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import XCTest

class TestsIntComparable: SuperTestsScalarComparable, ScalarComparableTesting {

  func testEqual() {
    XCTAssert(self.intValue == self.doubleValue);
    XCTAssert(self.intValue == self.cgFloatValue);
    
  }
  func testNotEqual() {
    XCTAssertFalse(self.intValue != self.doubleValue);
    XCTAssertFalse(self.intValue != self.cgFloatValue);
    
  }
  func testLessThanOrEqual() {
    XCTAssert(self.intValue <= self.doubleValue);
    XCTAssert(self.intValue <= self.cgFloatValue);
    
    self.intValue = -1
    XCTAssert(self.intValue <= self.doubleValue);
    XCTAssert(self.intValue <= self.cgFloatValue);
    
    
  }
  func testLessThan() {
    self.intValue = -1
    XCTAssert(self.intValue < self.doubleValue);
    XCTAssert(self.intValue < self.cgFloatValue);
    
  }
  
  func testGreaterThanOrEqual() {
    
    XCTAssert(self.intValue >= self.doubleValue);
    XCTAssert(self.intValue >= self.cgFloatValue);
    
    self.intValue = -1
    XCTAssertFalse(self.intValue >= self.doubleValue);
    XCTAssertFalse(self.intValue >= self.cgFloatValue);
    
  }
  
  func testGreaterThan() {
    self.intValue = -1
    XCTAssertFalse(self.intValue > self.doubleValue);
    XCTAssertFalse(self.intValue > self.cgFloatValue);
    
  }

}
