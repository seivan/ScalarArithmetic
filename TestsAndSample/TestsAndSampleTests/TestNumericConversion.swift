//
//  TestNumericConversion.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 05/07/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import CoreGraphics

import XCTest
class TestNumericConversion: XCTestCase {
  var cgFloatValue:CGFloat  = CGFloat(2.0)
  var doubleValue:Double    = Double(2.0)
  var intValue:Int          = Int(2)
  var int16Value:Int16      = Int16(2)
  var int32Value:Int32      = Int32(2)
  var int64Value:Int64      = Int64(2)
  var uInt16Value:UInt16    = UInt16(2)
  var uInt32Value:UInt32    = UInt32(2)
  var uInt64Value:UInt64    = UInt64(2)
  
  func testSetCGFloat() {
    
//    self.cgFloatValue = self.intValue
//    self.cgFloatValue = self.int16Value
//    self.cgFloatValue = self.int32Value
//    self.cgFloatValue = self.int64Value
//    self.cgFloatValue = self.uInt16Value
//    self.cgFloatValue = self.uInt32Value
//    self.cgFloatValue = self.uInt64Value
  }
  func testSetDouble() {
    self.doubleValue = self.cgFloatValue
    self.doubleValue = self.intValue
    self.doubleValue = self.int16Value
    self.doubleValue = self.int32Value
    self.doubleValue = self.int64Value
    self.doubleValue = self.uInt16Value
    self.doubleValue = self.uInt32Value
    self.doubleValue = self.uInt64Value
    
  }
  func testSetInt() {
    self.intValue = self.int16Value
    self.intValue = self.int32Value
    self.intValue = self.int64Value
    self.intValue = self.uInt16Value
    self.intValue = self.uInt32Value
    self.intValue = self.uInt64Value
    
  }
  

}
