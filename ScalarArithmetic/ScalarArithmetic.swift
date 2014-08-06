

import Darwin
import CoreGraphics


protocol ScalarFunctions {
  var acos:Double  {get}
  var asin:Double  {get}
  var atan:Double  {get}
  func atan2(x:Double) -> Double
  var cos:Double   {get}
  var sin:Double   {get}
  var tan:Double   {get}
  var exp:Double   {get}
  var exp2:Double  {get}
  var log:Double   {get}
  var log10:Double {get}
  var log2:Double  {get}
  func pow(exponent:Double) -> Double
  var sqrt:Double  {get}
}


extension Double :  ScalarFunctions {
  var abs:Double  { return Double.abs(self)   }
  var acos:Double { return Darwin.acos(self)  }
  var asin:Double { return Darwin.asin(self)  }
  var atan:Double { return Darwin.atan(self)  }
  func atan2(x:Double) -> Double { return Darwin.atan2(self,x) }
  var cos:Double  { return Darwin.cos(self)   }
  var sin:Double  { return Darwin.sin(self)   }
  var tan:Double  { return Darwin.tan(self)   }
  var exp:Double  { return Darwin.exp(self)   }
  var exp2:Double { return Darwin.exp2(self)  }
  var log:Double  { return Darwin.log(self)   }
  var log10:Double{ return Darwin.log10(self) }
  var log2:Double { return Darwin.log2(self)  }
  func pow(exponent:Double)-> Double { return Darwin.pow(self, exponent) }
  var sqrt:Double { return Darwin.sqrt(self)  }
  func __conversion() -> CGFloat { return CGFloat(self) }
}



protocol ScalarFloatingPointType {
  var toDouble:Double { get }
  init(_ value:Double)
}

extension CGFloat : ScalarFloatingPointType, ScalarFunctions {
  var toDouble:Double { return Double(self)      }
  var abs:Double      { return Double(self).abs  }
  var acos:Double     { return Double(self).acos }
  var asin:Double     { return Double(self).asin }
  var atan:Double     { return Double(self).atan }
  func atan2(x:Double) -> Double { return Double(self).atan2(x) }
  var cos:Double      { return Double(self).cos  }
  var sin:Double      { return Double(self).sin  }
  var tan:Double      { return Double(self).tan  }
  var exp:Double      { return Double(self).exp  }
  var exp2:Double     { return Double(self).exp2 }
  var log:Double      { return Double(self).log  }
  var log10:Double    { return Double(self).log10}
  var log2:Double     { return Double(self).log2 }
  func pow(exponent:Double)-> Double { return Double(self).pow(exponent) }
  var sqrt:Double     { return Double(self).sqrt }
  func __conversion() -> Double { return Double(self) }
}

extension Float : ScalarFloatingPointType { var toDouble:Double { return Double(self)      } }

protocol ScalarIntegerType : ScalarFloatingPointType {
   var toInt:Int { get }
}

extension Int : ScalarIntegerType {
  var toDouble:Double { return Double(self) }
  func __conversion() -> Double { return Double(self) }
  var toInt:Int { return Int(self) }

}
extension Int16 : ScalarIntegerType {
  var toDouble:Double { return Double(self) }
  func __conversion() -> Double { return Double(self) }
  var toInt:Int { return Int(self) }

}
extension Int32 : ScalarIntegerType {
  var toDouble:Double { return Double(self) }
  func __conversion() -> Double { return Double(self) }
  var toInt:Int { return Int(self) }

}
extension Int64 : ScalarIntegerType {
  var toDouble:Double { return Double(self) }
  func __conversion() -> Double { return Double(self) }
  var toInt:Int { return Int(self) }

}
extension UInt : ScalarFloatingPointType {
  var toDouble:Double { return Double(self) }
  func __conversion() -> Double { return Double(self) }

}
extension UInt16  : ScalarFloatingPointType {
  var toDouble:Double { return Double(self) }
  func __conversion() -> Double { return Double(self) }

}
extension UInt32 : ScalarFloatingPointType {
  var toDouble:Double { return Double(self) }
  func __conversion() -> Double { return Double(self) }
}
extension UInt64 : ScalarFloatingPointType {
  var toDouble:Double { return Double(self) }
  func __conversion() -> Double { return Double(self) }

}





func + <T:ScalarIntegerType>(lhs:T, rhs:Int) -> Int { return lhs + rhs }
func + <T:ScalarIntegerType>(lhs:Int, rhs:T) -> Int { return lhs + rhs.toInt }

func - <T:ScalarIntegerType>(lhs:T, rhs:Int) -> Int { return lhs.toInt - rhs }
func - <T:ScalarIntegerType>(lhs:Int, rhs:T) -> Int { return lhs - rhs.toInt }

func * <T:ScalarIntegerType>(lhs:T, rhs:Int) -> Int { return lhs.toInt * rhs }
func * <T:ScalarIntegerType>(lhs:Int, rhs:T) -> Int { return lhs * rhs.toInt }

func / <T:ScalarIntegerType>(lhs:T, rhs:Int) -> Int { return lhs.toInt / rhs }
func / <T:ScalarIntegerType>(lhs:Int, rhs:T) -> Int { return lhs / rhs.toInt }



//Equality T<===>T
func == <T:ScalarFloatingPointType, U:ScalarFloatingPointType> (lhs:U,rhs:T) -> Bool { return (lhs.toDouble == rhs.toDouble) }
func == <T:ScalarFloatingPointType> (lhs:Double,rhs:T) -> Bool { return (lhs == rhs.toDouble) }
func == <T:ScalarFloatingPointType> (lhs:T,rhs:Double) -> Bool { return (lhs.toDouble == rhs) }

func != <T:ScalarFloatingPointType, U:ScalarFloatingPointType> (lhs:U,rhs:T) -> Bool { return (lhs.toDouble == rhs.toDouble) == false }
func != <T:ScalarFloatingPointType> (lhs:Double,rhs:T) -> Bool { return (lhs == rhs.toDouble) == false }
func != <T:ScalarFloatingPointType> (lhs:T,rhs:Double) -> Bool { return (lhs.toDouble == rhs) == false }

func <= <T:ScalarFloatingPointType, U:ScalarFloatingPointType> (lhs:T,rhs:U) -> Bool { return (lhs.toDouble <= rhs.toDouble) }
func <= <T:ScalarFloatingPointType> (lhs:Double, rhs:T) -> Bool { return (lhs <= rhs.toDouble) }
func <= <T:ScalarFloatingPointType> (lhs:T,rhs:Double) -> Bool { return (lhs.toDouble <= rhs) }

func < <T:ScalarFloatingPointType, U:ScalarFloatingPointType> (lhs:T,rhs:U) -> Bool { return (lhs.toDouble <  rhs.toDouble) }
func < <T:ScalarFloatingPointType> (lhs:Double, rhs:T) -> Bool { return (lhs <  rhs.toDouble) }
func < <T:ScalarFloatingPointType> (lhs:T,rhs:Double) -> Bool { return (lhs.toDouble <  rhs) }

func >  <T:ScalarFloatingPointType, U:ScalarFloatingPointType> (lhs:T,rhs:U) -> Bool { return (lhs <= rhs) == false }
func >  <T:ScalarFloatingPointType> (lhs:Double, rhs:T) -> Bool { return (lhs <= rhs) == false}
func >  <T:ScalarFloatingPointType> (lhs:T,rhs:Double) -> Bool { return (lhs <= rhs) == false }

func >= <T:ScalarFloatingPointType, U:ScalarFloatingPointType> (lhs:T,rhs:U) -> Bool { return (lhs < rhs) == false }
func >= <T:ScalarFloatingPointType> (lhs:Double, rhs:T) -> Bool { return (lhs < rhs) == false }
func >= <T:ScalarFloatingPointType> (lhs:T,rhs:Double) -> Bool { return (lhs < rhs) == false }



//SUBTRACTION
func - <T:ScalarFloatingPointType, U:ScalarFloatingPointType>(lhs:U, rhs:T) -> Double  {return (lhs.toDouble - rhs.toDouble) }
func - <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> T  { return T(lhs - rhs.toDouble) }
func - <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> T  { return T(lhs.toDouble - rhs) }
func - <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> Double  { return (lhs - rhs.toDouble) }
func - <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> Double  { return (lhs.toDouble - rhs) }
func -= <T:ScalarFloatingPointType, U:ScalarFloatingPointType>(inout lhs:T, rhs:U) { lhs = T(lhs.toDouble - rhs.toDouble) }
func -= <T:ScalarFloatingPointType>(inout lhs:Double, rhs:T)  { lhs = lhs - rhs.toDouble }

//ADDITION
func + <T:ScalarFloatingPointType, U:ScalarFloatingPointType>(lhs:U, rhs:T) -> Double  {return (lhs.toDouble + rhs.toDouble) }
func + <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> T  { return T(lhs + rhs.toDouble) }
func + <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> T  { return T(lhs.toDouble + rhs) }
func + <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> Double  { return (lhs + rhs.toDouble) }
func + <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> Double  { return (lhs.toDouble + rhs) }
func += <T:ScalarFloatingPointType, U:ScalarFloatingPointType>(inout lhs:T, rhs:U) { lhs = T(lhs.toDouble + rhs.toDouble) }
func += <T:ScalarFloatingPointType>(inout lhs:Double, rhs:T)  { lhs = lhs + rhs.toDouble }

//MULTIPLICATION
func * <T:ScalarFloatingPointType, U:ScalarFloatingPointType>(lhs:U, rhs:T) -> Double  {return (lhs.toDouble * rhs.toDouble) }
func * <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> T  { return T(lhs * rhs.toDouble) }
func * <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> T  { return T(lhs.toDouble * rhs) }
func * <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> Double  { return (lhs * rhs.toDouble) }
func * <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> Double  { return (lhs.toDouble * rhs) }
func *= <T:ScalarFloatingPointType, U:ScalarFloatingPointType>(inout lhs:T, rhs:U) { lhs = T(lhs.toDouble * rhs.toDouble) }
func *= <T:ScalarFloatingPointType>(inout lhs:Double, rhs:T)  { lhs = lhs * rhs.toDouble }

//DIVISION
func / <T:ScalarFloatingPointType, U:ScalarFloatingPointType>(lhs:U, rhs:T) -> Double  {return (lhs.toDouble / rhs.toDouble) }
func / <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> T  { return T(lhs / rhs.toDouble) }
func / <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> T  { return T(lhs.toDouble / rhs) }
func / <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> Double  { return (lhs / rhs.toDouble) }
func / <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> Double  { return (lhs.toDouble / rhs) }
func /= <T:ScalarFloatingPointType, U:ScalarFloatingPointType>(inout lhs:T, rhs:U) { lhs = T(lhs.toDouble / rhs.toDouble) }
func /= <T:ScalarFloatingPointType>(inout lhs:Double, rhs:T)  { lhs = lhs / rhs.toDouble }


