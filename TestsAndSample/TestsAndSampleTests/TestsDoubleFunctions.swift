//
//  TestsAndSampleTests.swift
//  TestsAndSampleTests
//
//  Created by Seivan Heidari on 29/06/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import XCTest


class TestsDouble: SuperTestsScalarFunctions {
  let doubleValue = 5.5
  var expected:Double?

  
  func testAcos() {
    self.expected = acos(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, self.doubleValue.acos)
  }
  func testAsin() {
    self.expected = asin(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, self.doubleValue.asin)
  }
  func testAtan() {
    self.expected = atan(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, self.doubleValue.atan)
  }
  func testAtan2() {
    self.expected = atan2(self.doubleValue, self.additionalValue)
    XCTAssertEqualObjects(self.expected!, self.doubleValue.atan2(self.additionalValue))
  }
  func testCos() {
    self.expected = cos(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, self.doubleValue.cos)
  }
  func testSin() {
    self.expected = sin(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, self.doubleValue.sin)
  }
  func testTan() {
    self.expected = tan(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, self.doubleValue.tan)
  }
  func testExp() {
    self.expected = exp(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, self.doubleValue.exp)
  }
  func testExp2() {
    self.expected = exp2(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, self.doubleValue.exp2)
  }
  func testLog() {
    self.expected = log(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, self.doubleValue.log)
  }
  func testLog10() {
    self.expected = log10(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, self.doubleValue.log10)
  }
  func testLog2() {
    self.expected = log2(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, self.doubleValue.log2)
  }
  func testPow() {
    self.expected = pow(self.doubleValue, self.additionalValue)
    XCTAssertEqualObjects(self.expected!, self.doubleValue.pow(self.additionalValue))
  }
  func testSqrt() {
    self.expected = sqrt(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, self.doubleValue.sqrt)
  }

}


