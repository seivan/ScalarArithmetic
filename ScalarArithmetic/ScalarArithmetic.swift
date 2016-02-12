

import Darwin
import CoreGraphics


public protocol ScalarFloatingPointType:  Comparable {
  var toDouble:Double { get }
  init(_ value:Double)
}
extension CGFloat : ScalarFloatingPointType {
  public var toDouble:Double  { return Double(self) }
}

extension Float : ScalarFloatingPointType {
  public var toDouble:Double  { return Double(self) }
}
extension Double  {
  public var toCGFloat:CGFloat  { return CGFloat(self) }
}


public protocol FloatingPointOperating {
  typealias Main : FloatingPointType
  typealias Alternative : FloatingPointType
  typealias Avoid : FloatingPointType
  
  var abs:Main   {get}
  var acos:Main  {get}
  var asin:Main  {get}
  var atan:Main  {get}
  func atan2(rhs:Main) -> Main
  func atan2(rhs:Alternative) -> Main
  var cos:Main   {get}
  var sin:Main   {get}
  var tan:Main   {get}
  var exp:Main   {get}
  var exp2:Main  {get}
  var log:Main   {get}
  var log10:Main {get}
  var log2:Main  {get}
  func pow(rhs:Main) -> Main
  func pow(rhs:Alternative) -> Main
  var sqrt:Main  {get}
}



extension Double : FloatingPointOperating {
  public typealias Main = Double
  public typealias Alternative = CGFloat
  public typealias Avoid = Float
  
  
  public var abs:Main  { return Main.abs(self)   }
  public var acos:Main { return Darwin.acos(self)  }
  public var asin:Main { return Darwin.asin(self)  }
  public var atan:Main { return Darwin.atan(self)  }
  public func atan2(x:Main) -> Main { return Darwin.atan2(self,x) }
  public func atan2(x:Alternative) -> Main { return Darwin.atan2(self, Main(x)) }
  public var cos:Main  { return Darwin.cos(self)   }
  public var sin:Main  { return Darwin.sin(self)   }
  public var tan:Main  { return Darwin.tan(self)   }
  public var exp:Main  { return Darwin.exp(self)   }
  public var exp2:Main { return Darwin.exp2(self)  }
  public var log:Main  { return Darwin.log(self)   }
  public var log10:Main{ return Darwin.log10(self) }
  public var log2:Main { return Darwin.log2(self)  }
  public func pow(rhs:Main)-> Main { return Darwin.pow(self, rhs) }
  public func pow(rhs:Alternative)-> Main { return Darwin.pow(self, Main(rhs)) }
  public var sqrt:Main { return Darwin.sqrt(self)  }
  
}


extension CGFloat : FloatingPointOperating {
  public typealias Main = CGFloat
  public typealias Alternative = Double
  public typealias Avoid = Float
  
  public var abs:Main      { return Main.abs(self)  }
  public var acos:Main     { return Main(Darwin.acos(self.native)) }
  public var asin:Main     { return Main(Darwin.asin(self.native)) }
  public var atan:Main     { return Main(Darwin.atan(self.native)) }
  public func atan2(rhs:Main) -> Main { return Main(Darwin.atan2(self.native, rhs.native)) }
  public func atan2(rhs:Alternative) -> Main { return Main(Darwin.atan2(self.native, Main(rhs).native)) }
  public var cos:Main      { return Main(Darwin.cos(self.native)) }
  public var sin:Main      { return Main(Darwin.sin(self.native)) }
  public var tan:Main      { return Main(Darwin.tan(self.native)) }
  public var exp:Main      { return Main(Darwin.exp(self.native)) }
  public var exp2:Main     { return Main(Darwin.exp2(self.native)) }
  public var log:Main      { return Main(Darwin.log(self.native)) }
  public var log10:Main    { return Main(Darwin.log10(self.native)) }
  public var log2:Main     { return Main(Darwin.log2(self.native)) }
  public func pow(rhs:Main)-> Main { return Main(Darwin.pow(self.native, rhs.native)) }
  public func pow(rhs:Alternative)-> Main { return Main(Darwin.pow(self.native, Alternative(rhs))) }
  public var sqrt:Main     { return Main(Darwin.sqrt(self.native)) }
  
}

extension Float :  FloatingPointOperating {
  public typealias Main = Double
  public typealias Alternative = CGFloat
  public typealias Avoid = Float
  
  
  public var abs:Main  { return Main.abs(Main(self))   }
  public var acos:Main { return Darwin.acos(Main(self))  }
  public var asin:Main { return Darwin.asin(Main(self))  }
  public var atan:Main { return Darwin.atan(Main(self))  }
  public func atan2(x:Main) -> Main { return Darwin.atan2(Main(self), x) }
  public func atan2(x:Alternative) -> Main { return Darwin.atan2(Main(self), Main(x)) }
  public var cos:Main  { return Darwin.cos(Main(self))  }
  public var sin:Main  { return Darwin.sin(Main(self))  }
  public var tan:Main  { return Darwin.tan(Main(self))  }
  public var exp:Main  { return Darwin.exp(Main(self))  }
  public var exp2:Main { return Darwin.exp2(Main(self))  }
  public var log:Main  { return Darwin.log(Main(self))  }
  public var log10:Main{ return Darwin.log10(Main(self))  }
  public var log2:Main { return Darwin.log2(Main(self))  }
  public func pow(rhs:Main)-> Main { return Darwin.pow(Main(self), rhs) }
  public func pow(rhs:Alternative)-> Main { return Darwin.pow(Main(self), Main(rhs)) }
  public var sqrt:Main { return Darwin.sqrt(Main(self))  }
  
}

public protocol ScalarIntegerType : ScalarFloatingPointType {
  var toInt:Int { get }
}

extension Int : ScalarIntegerType {
  public var toDouble:Double { return Double(self) }
  public var toInt:Int { return Int(self) }
  
}
extension Int16 : ScalarIntegerType {
  public var toDouble:Double { return Double(self) }
  public var toInt:Int { return Int(self) }
  
}
extension Int32 : ScalarIntegerType {
  public var toDouble:Double { return Double(self) }
  public var toInt:Int { return Int(self) }
  
}
extension Int64 : ScalarIntegerType {
  public var toDouble:Double { return Double(self) }
  public var toInt:Int { return Int(self) }
  
}
extension UInt : ScalarFloatingPointType {
  public var toDouble:Double { return Double(self) }
  
}
extension UInt16  : ScalarFloatingPointType {
  public var toDouble:Double { return Double(self) }
  
}
extension UInt32 : ScalarFloatingPointType {
  public var toDouble:Double { return Double(self) }
}
extension UInt64 : ScalarFloatingPointType {
  public var toDouble:Double { return Double(self) }
  
}






////Equality T<===>T
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
//
//
//
////SUBTRACTION
func - <T:ScalarFloatingPointType, U:ScalarFloatingPointType>(lhs:T, rhs:U) -> T  {return T(lhs.toDouble - rhs.toDouble) }
func - <T:ScalarFloatingPointType, U:ScalarFloatingPointType>(lhs:U, rhs:T) -> T  {return T(lhs.toDouble - rhs.toDouble) }
func - <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> T  { return T(lhs - rhs.toDouble) }
func - <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> T  { return T(lhs.toDouble - rhs) }
func - <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> Double  { return lhs - rhs.toDouble }
func - <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> Double  { return lhs.toDouble - rhs }

func -= <T:ScalarIntegerType, U:ScalarIntegerType>(inout lhs:T, rhs:U)  { lhs = T(lhs - rhs.toDouble) }
func -= <T:ScalarFloatingPointType>(inout lhs:Double, rhs:T)  { lhs = lhs - rhs.toDouble }
func -= (inout lhs:CGFloat, rhs:Double)  { lhs = lhs - rhs }
func -= <T:ScalarFloatingPointType>(inout lhs:CGFloat, rhs:T) { lhs = CGFloat(lhs - rhs.toDouble) }

////ADDITION
//

func + <T:ScalarFloatingPointType, U:ScalarFloatingPointType>(lhs:T, rhs:U) -> T  {return T(lhs.toDouble + rhs.toDouble) }
func + <T:ScalarFloatingPointType, U:ScalarFloatingPointType>(lhs:U, rhs:T) -> T  {return T(lhs.toDouble + rhs.toDouble) }
func + <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> T  { return T(lhs + rhs.toDouble) }
func + <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> T  { return T(lhs.toDouble + rhs) }
func + <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> Double  { return lhs + rhs.toDouble }
func + <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> Double  { return lhs.toDouble + rhs }

func += <T:ScalarIntegerType, U:ScalarIntegerType>(inout lhs:T, rhs:U)  { lhs = T(lhs + rhs.toDouble) }
func += <T:ScalarFloatingPointType>(inout lhs:Double, rhs:T)  { lhs = lhs + rhs.toDouble }
func += (inout lhs:CGFloat, rhs:Double)  { lhs = lhs + rhs }
func += <T:ScalarFloatingPointType>(inout lhs:CGFloat, rhs:T) { lhs = CGFloat(lhs + rhs.toDouble) }

////MULTIPLICATION
func * <T:ScalarFloatingPointType, U:ScalarFloatingPointType>(lhs:T, rhs:U) -> T  {return T(lhs.toDouble * rhs.toDouble) }
func * <T:ScalarFloatingPointType, U:ScalarFloatingPointType>(lhs:U, rhs:T) -> T  {return T(lhs.toDouble * rhs.toDouble) }
func * <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> T  { return T(lhs * rhs.toDouble) }
func * <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> T  { return T(lhs.toDouble * rhs) }
func * <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> Double  { return lhs * rhs.toDouble }
func * <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> Double  { return lhs.toDouble * rhs }

func *= <T:ScalarIntegerType, U:ScalarIntegerType>(inout lhs:T, rhs:U)  { lhs = T(lhs * rhs.toDouble) }
func *= <T:ScalarFloatingPointType>(inout lhs:Double, rhs:T)  { lhs = lhs * rhs.toDouble }
func *= (inout lhs:CGFloat, rhs:Double)  { lhs = lhs * rhs }
func *= <T:ScalarFloatingPointType>(inout lhs:CGFloat, rhs:T) { lhs = CGFloat(lhs * rhs.toDouble) }
//
////DIVISION
func / <T:ScalarFloatingPointType, U:ScalarFloatingPointType>(lhs:T, rhs:U) -> T  {return T(lhs.toDouble / rhs.toDouble) }
func / <T:ScalarFloatingPointType, U:ScalarFloatingPointType>(lhs:U, rhs:T) -> T  {return T(lhs.toDouble / rhs.toDouble) }
func / <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> T  { return T(lhs / rhs.toDouble) }
func / <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> T  { return T(lhs.toDouble / rhs) }
func / <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> Double  { return lhs / rhs.toDouble }
func / <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> Double  { return lhs.toDouble / rhs }

func /= <T:ScalarIntegerType, U:ScalarIntegerType>(inout lhs:T, rhs:U)  { lhs = T(lhs / rhs.toDouble) }
func /= <T:ScalarFloatingPointType>(inout lhs:Double, rhs:T)  { lhs = lhs / rhs.toDouble }
func /= (inout lhs:CGFloat, rhs:Double)  { lhs = lhs / rhs }
func /= <T:ScalarFloatingPointType>(inout lhs:CGFloat, rhs:T) { lhs = CGFloat(lhs / rhs.toDouble) }
//
//
