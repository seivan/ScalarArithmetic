//
//  TestsCGFloatComparable.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 01/07/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import XCTest

class TestsCGFloatComparable: SuperTestsScalarComparable, ScalarComparableTesting {

  func testEqual() {
    XCTAssert(self.cgFloatValue == self.doubleValue);
    XCTAssert(self.cgFloatValue == self.intValue);
    
  }
  func testNotEqual() {
    XCTAssertFalse(self.cgFloatValue != self.doubleValue);
    XCTAssertFalse(self.cgFloatValue != self.intValue);
    
  }
  func testLessThanOrEqual() {
    XCTAssert(self.cgFloatValue <= self.doubleValue);
    XCTAssert(self.cgFloatValue <= self.intValue);
    
    self.cgFloatValue = -1
    XCTAssert(self.cgFloatValue <= self.doubleValue);
    XCTAssert(self.cgFloatValue <= self.intValue);
    
    
    
  }
  func testLessThan() {
    self.cgFloatValue = -1
    XCTAssert(self.cgFloatValue < self.doubleValue);
    XCTAssert(self.cgFloatValue < self.intValue);
    
  }
  
  func testGreaterThanOrEqual() {
    
    XCTAssert(self.cgFloatValue >= self.doubleValue);
    XCTAssert(self.cgFloatValue >= self.intValue);
    
    self.cgFloatValue = -1
    XCTAssertFalse(self.cgFloatValue >= self.doubleValue);
    XCTAssertFalse(self.cgFloatValue >= self.intValue);
    
    
  }
  
  func testGreaterThan() {
    self.cgFloatValue = -1
    XCTAssertFalse(self.cgFloatValue > self.doubleValue);
    XCTAssertFalse(self.cgFloatValue >  self.intValue);
    
    
  }

}
