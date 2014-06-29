//
//  TestsScalarArithmetic.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 29/06/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import CoreGraphics
import XCTest

class TestsScalarArithmetic: SuperTestsScalarFunctions {
  let doubleValue:Double      = 5.0
  let cgFloatValue:CGFloat    = 5.0
  let intValue:Int            = 5
  var expectedValue:Double?
  var assignmentValue:Double  = 0.0
  
  func testAddition() {
    self.expectedValue = 10.0
    
    self.assignmentValue = self.doubleValue + self.cgFloatValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue + self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)

    self.assignmentValue = self.intValue + self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)

    self.assignmentValue = self.doubleValue + self.intValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
  }

  func testAdditionAssignment() {
    self.expectedValue = 6.0

    self.assignmentValue = 1.0
    self.assignmentValue += self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 1.0
    self.assignmentValue += self.cgFloatValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 1.0
    self.assignmentValue += self.intValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 1.0
    self.assignmentValue += self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
  
  }
  
  func testSubtraction() {
    self.expectedValue = 0.0
    
    self.assignmentValue = self.doubleValue - self.cgFloatValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue - self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.intValue - self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.doubleValue - self.intValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)

  }
  func testSubtractionAssignment() {
    self.expectedValue = -4.0

    self.assignmentValue = 1.0
    self.assignmentValue -= self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)

    self.assignmentValue = 1.0
    self.assignmentValue -= self.cgFloatValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 1.0
    self.assignmentValue -= self.intValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 1.0
    self.assignmentValue -= self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
  
  }
  
  func testMultiplication() {
    self.expectedValue = 25.0
    
    self.assignmentValue = self.doubleValue * self.cgFloatValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue * self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.intValue * self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.doubleValue * self.intValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
  }
  
  func testMultiplicationAssignment() {
    self.expectedValue   = 10.0

    self.assignmentValue = 2.0
    self.assignmentValue *= self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 2.0
    self.assignmentValue *= self.cgFloatValue
    XCTAssertEqual(self.assignmentValue,  self.expectedValue!)
    
    self.assignmentValue = 2.0
    self.assignmentValue *= self.intValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 2.0
    self.assignmentValue *= self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
  
  }
  func testDivision() {
    self.expectedValue = 1.0
    
    self.assignmentValue = self.doubleValue / self.cgFloatValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.cgFloatValue / self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.intValue / self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = self.doubleValue / self.intValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
  
  }
  func testDivisionAssignment() {
    self.expectedValue = 2.0
    
    self.assignmentValue = 10.0
    self.assignmentValue /= self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)

    self.assignmentValue = 10.0
    self.assignmentValue /= self.cgFloatValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 10.0
    self.assignmentValue /= self.intValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = 10.0
    self.assignmentValue /= self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
  
  }
  


}
