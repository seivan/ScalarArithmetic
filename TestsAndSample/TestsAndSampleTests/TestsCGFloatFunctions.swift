//
//  TestsCGFloat.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 29/06/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import XCTest
import CoreGraphics

class TestsCGFloat: SuperTestsScalarFunctions {
  let doubleValue:CGFloat = 5.5
  var expected:CGFloat?
  
#if !(arch(x86_64) || arch(arm64))
  func testAcos() {
    self.expected = acosf(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, CGFloat(self.doubleValue.acos))
  }
  func testAsin() {
    self.expected = asinf(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, self.doubleValue.asin)
  }
  func testAtan() {
    self.expected = atanf(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, CGFloat(self.doubleValue.atan))
  }
  func testAtan2() {
    self.expected = atan2f(self.doubleValue, CGFloat(self.additionalValue))
    XCTAssertEqualObjects(self.expected!, CGFloat(self.doubleValue.atan2(self.additionalValue)))
  }
  func testCos() {
    self.expected = cosf(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, CGFloat(self.doubleValue.cos))
  }
  func testSin() {
    self.expected = sinf(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, CGFloat(self.doubleValue.sin))
  }
  func testTan() {
    self.expected = tanf(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, CGFloat(self.doubleValue.tan))
  }
  func testExp() {
    self.expected = expf(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, CGFloat(self.doubleValue.exp))
  }
  func testExp2() {
    self.expected = exp2f(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, CGFloat(self.doubleValue.exp2))
  }
  func testLog() {
    self.expected = logf(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, CGFloat(self.doubleValue.log))
  }
  func testLog10() {
    self.expected = log10f(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, CGFloat(self.doubleValue.log10))
  }
  func testLog2() {
    self.expected = log2f(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, CGFloat(self.doubleValue.log2))
  }
//  func testPow() {
//    self.expected = powf(self.doubleValue, CGFloat(self.additionalValue))
//    XCTAssertEqualObjects(Double(self.expected!), (self.doubleValue.pow(self.additionalValue)))
//  }
  func testSqrt() {
    self.expected = sqrtf(self.doubleValue)
    XCTAssertEqualObjects(self.expected!, CGFloat(self.doubleValue.sqrt))
  }
#endif
}
