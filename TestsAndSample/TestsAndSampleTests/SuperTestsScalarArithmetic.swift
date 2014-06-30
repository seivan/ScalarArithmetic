//
//  TestsScalarArithmetic.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 29/06/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import CoreGraphics
import XCTest

protocol ScalarArithmeticTesting {
  func testAddition()
  func testAdditionAssignment()
  func testSubtraction()
  func testSubtractionAssignment()
  func testMultiplication()
  func testMultiplicationAssignment()
  func testDivision()
  func testDivisionAssignment()
}
class SuperTestsScalarArithmetic: XCTestCase {
  let doubleValue:Double      = 5.0
  let cgFloatValue:CGFloat    = 5.0
  let intValue:Int            = 5
  var expectedValue:Double?
  var assignmentValue:Double  = 0.0


}
