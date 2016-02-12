//
//  TestsAndSampleTests.swift
//  TestsAndSampleTests
//
//  Created by Seivan Heidari on 29/06/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import XCTest

//extension Double : FloatingPointOperating {}
//extension CGFloat : FloatingPointOperating {}

class TestsMathFunctionsDouble: XCTestCase {
  typealias Main = Double;
  let mainType:Double = 0.5
  var expected:Double?
  let alternativeType:CGFloat = 7.7
  
  
  
  func testAcos() {
    self.expected = acos(self.mainType)
    XCTAssertEqual(self.expected!, self.mainType.acos)
  }
  func testAsin() {
    self.expected = asin(self.mainType)
    XCTAssertEqual(self.expected!, self.mainType.asin)
  }
  func testAtan() {
    self.expected = atan(self.mainType)
    XCTAssertEqual(self.expected!, self.mainType.atan)
  }
  func testAtan2() {
    self.expected = atan2(self.mainType, Main(self.alternativeType))
    XCTAssertEqual(self.expected!, self.mainType.atan2(self.alternativeType))
  }
  func testCos() {
    self.expected = cos(self.mainType)
    XCTAssertEqual(self.expected!, self.mainType.cos)
  }
  func testSin() {
    self.expected = sin(self.mainType)
    XCTAssertEqual(self.expected!, self.mainType.sin)
  }
  func testTan() {
    self.expected = tan(self.mainType)
    XCTAssertEqual(self.expected!, self.mainType.tan)
  }
  func testExp() {
    self.expected = exp(self.mainType)
    XCTAssertEqual(self.expected!, self.mainType.exp)
  }
  func testExp2() {
    self.expected = exp2(self.mainType)
    XCTAssertEqual(self.expected!, self.mainType.exp2)
  }
  func testLog() {
    self.expected = log(self.mainType)
    XCTAssertEqual(self.expected!, self.mainType.log)
  }
  func testLog10() {
    self.expected = log10(self.mainType)
    XCTAssertEqual(self.expected!, self.mainType.log10)
  }
  func testLog2() {
    self.expected = log2(self.mainType)
    XCTAssertEqual(self.expected!, self.mainType.log2)
  }
  func testPow() {
    self.expected = pow(self.mainType, Double(self.alternativeType))
    XCTAssertEqual(self.expected!, self.mainType.pow(self.alternativeType))
  }
  func testSqrt() {
    self.expected = sqrt(self.mainType)
    XCTAssertEqual(self.expected!, self.mainType.sqrt)
  }
  
}


//
//  TestsCGFloat.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 29/06/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import XCTest
import CoreGraphics

class TestsMathFunctionsCGFloat: XCTestCase {
  typealias Main = CGFloat
  let mainType:CGFloat = 0.4
  var expected:CGFloat?
  let alternativeType:Double = 7.7
  
  
  
  func testAcos() {
    self.expected = acos(self.mainType)
    XCTAssertEqual(self.expected!, (self.mainType.acos))
  }
  func testAsin() {
    self.expected = asin(self.mainType)
    XCTAssertEqual(self.expected!, self.mainType.asin)
  }
  func testAtan() {
    self.expected = atan(self.mainType)
    XCTAssertEqual(self.expected!, (self.mainType.atan))
  }
  func testAtan2() {
    self.expected = atan2(self.mainType, CGFloat(self.alternativeType))
    XCTAssertEqual(self.expected!, (self.mainType.atan2(self.alternativeType)))
  }
  func testCos() {
    self.expected = cos(self.mainType)
    XCTAssertEqual(self.expected!, (self.mainType.cos))
  }
  func testSin() {
    self.expected = sin(self.mainType)
    XCTAssertEqual(self.expected!, (self.mainType.sin))
  }
  func testTan() {
    self.expected = tan(self.mainType)
    XCTAssertEqual(self.expected!, (self.mainType.tan))
  }
  func testExp() {
    self.expected = exp(self.mainType)
    XCTAssertEqual(self.expected!, (self.mainType.exp))
  }
  func testExp2() {
    self.expected = exp2(self.mainType)
    XCTAssertEqual(self.expected!, (self.mainType.exp2))
  }
  func testLog() {
    self.expected = log(self.mainType)
    XCTAssertEqual(self.expected!, (self.mainType.log))
  }
  func testLog10() {
    self.expected = log10(self.mainType)
    XCTAssertEqual(self.expected!, (self.mainType.log10))
  }
  func testLog2() {
    self.expected = log2(self.mainType)
    XCTAssertEqual(self.expected!, (self.mainType.log2))
  }
  func testPow() {
    self.expected = pow(self.mainType, Main(self.alternativeType))
    XCTAssertEqual(self.expected!, self.mainType.pow(self.alternativeType))
  }
  func testSqrt() {
    self.expected = sqrt(self.mainType)
    XCTAssertEqual(self.expected!, (self.mainType.sqrt))
  }
  
}
