//
//  TestsIntArithmeticTesting.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 01/07/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import XCTest


class TestsIntArithmeticTesting: SuperTestsScalarFloatingPointType, ScalarFloatingPointTypeTesting {
  var assignmentIntValue:Int = Int(0)
  var expectedIntValue:Int?

  var expectedValue:Double?
  var assignmentValue:Double  = 0.0

  
  func testAddition() {
    self.expectedValue = 10.0

    
    self.assignmentValue = self.intValue + self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = Double(self.intValue + self.cgFloatValue)
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.expectedIntValue = 10
    
    self.assignmentIntValue = self.intValue + self.int16Value
    XCTAssertEqual(self.assignmentIntValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue + self.int32Value
    XCTAssertEqual(self.assignmentIntValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue + self.int64Value
    XCTAssertEqual(self.assignmentIntValue, self.expectedIntValue!)
    

    
    
  }
  
  func testAdditionAssignment() {
    self.expectedValue = 6.0

    
    self.expectedIntValue = 6

    self.assignmentIntValue = 1
    self.assignmentIntValue += self.int16Value
    XCTAssertEqual(self.assignmentIntValue, self.expectedIntValue!)

    self.assignmentIntValue = 1
    self.assignmentIntValue += self.int32Value
    XCTAssertEqual(self.assignmentIntValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 1
    self.assignmentIntValue += self.int64Value
    XCTAssertEqual(self.assignmentIntValue, self.expectedIntValue!)
    


  }

  func testSubtraction() {
    self.expectedValue = 0.0
    
    self.assignmentValue = self.intValue - self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)

    self.assignmentValue = Double(self.intValue - self.cgFloatValue)
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.expectedIntValue = 0
    self.assignmentIntValue = self.intValue - self.int16Value
    XCTAssertEqual(self.assignmentIntValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue - self.int32Value
    XCTAssertEqual(self.assignmentIntValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue - self.int64Value
    XCTAssertEqual(self.assignmentIntValue, self.expectedIntValue!)
    

    
  }
  
  func testSubtractionAssignment() {
    self.expectedValue = -4.0

    self.assignmentValue = 1.0
    self.assignmentValue -= self.intValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.expectedIntValue = -4
    
    self.assignmentIntValue = 1
    self.assignmentIntValue -= self.int16Value
    XCTAssertEqual(self.assignmentIntValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 1
    self.assignmentIntValue -= self.int32Value
    XCTAssertEqual(self.assignmentIntValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 1
    self.assignmentIntValue -= self.int64Value
    XCTAssertEqual(self.assignmentIntValue, self.expectedIntValue!)

    
    
  }

  func testMultiplication() {
    self.expectedValue = 25.0
    
    self.assignmentValue = self.intValue * self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = Double(self.intValue * self.cgFloatValue)
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.expectedIntValue = 25
    self.assignmentIntValue = self.intValue * self.int16Value
    XCTAssertEqual(self.assignmentIntValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue * self.int32Value
    XCTAssertEqual(self.assignmentIntValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue * self.int64Value
    XCTAssertEqual(self.assignmentIntValue, self.expectedIntValue!)
    

    
    
    
  }
  
  func testMultiplicationAssignment() {
    self.expectedValue   = 10.0

    self.assignmentValue = 2.0
    self.assignmentValue *= self.intValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.expectedIntValue = 10
    
    self.assignmentIntValue = 2
    self.assignmentIntValue *= self.int16Value
    XCTAssertEqual(self.assignmentIntValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 2
    self.assignmentIntValue *= self.int32Value
    XCTAssertEqual(self.assignmentIntValue, self.expectedIntValue!)
    
    self.assignmentIntValue = 2
    self.assignmentIntValue *= self.int64Value
    XCTAssertEqual(self.assignmentIntValue, self.expectedIntValue!)
    
    
    
  }
  func testDivision() {
    self.expectedValue = 1.0
    
    self.assignmentValue = self.intValue / self.doubleValue
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.assignmentValue = Double(self.intValue / self.cgFloatValue)
    XCTAssertEqual(self.assignmentValue, self.expectedValue!)
    
    self.expectedIntValue = 1
    self.assignmentIntValue = self.intValue / self.int16Value
    XCTAssertEqual(self.assignmentIntValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue / self.int32Value
    XCTAssertEqual(self.assignmentIntValue, self.expectedIntValue!)
    
    self.assignmentIntValue = self.intValue / self.int64Value
    XCTAssertEqual(self.assignmentIntValue, self.expectedIntValue!)
    
  }
  
}
