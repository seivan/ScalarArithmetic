//
//  ScalarArithmeticExperimental.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 03/02/16.
//  Copyright © 2016 Seivan Heidari. All rights reserved.
//



import Darwin
import CoreGraphics
import Foundation


private protocol InternalFloatingPointMathTyping {
    typealias Main
    typealias Alternative
    typealias Avoid

}

extension InternalFloatingPointMathTyping {
    private var __castToMain:Main { return self as! Main }
    private var __castToAlternative:Alternative { return self as! Alternative }
    
}

extension InternalFloatingPointMathTyping where Main == Double, Alternative == CGFloat, Avoid == Float {
    private var __abs:Main  {return Main.abs(self.__castToMain) }
    private var __acos:Main  {return Darwin.acos(self.__castToMain) }
    private var __asin:Main { return Darwin.asin(self.__castToMain)  }
    private var __atan:Main { return Darwin.atan(self.__castToMain)  }
    private func __atan2(rhs:Main) -> Main { return Darwin.atan2(self.__castToMain, rhs) }
    private func __atan2(rhs:Alternative) -> Main { return Darwin.atan2(self.__castToMain, Main(rhs) )}
    private var __cos:Main  { return Darwin.cos(self.__castToMain)   }
    private var __sin:Main  { return Darwin.sin(self.__castToMain)   }
    private var __tan:Main  { return Darwin.tan(self.__castToMain)   }
    private var __exp:Main  { return Darwin.exp(self.__castToMain)   }
    private var __exp2:Main { return Darwin.exp2(self.__castToMain)  }
    private var __log:Main  { return Darwin.log(self.__castToMain)   }
    private var __log10:Main{ return Darwin.log10(self.__castToMain) }
    private var __log2:Main { return Darwin.log2(self.__castToMain)  }
    private func __pow(rhs:Main)-> Main { return Darwin.pow(self.__castToMain, rhs) }
    private func __pow(rhs:Alternative)-> Main { return Darwin.pow(self.__castToMain, rhs.toDouble) }
    private var __sqrt:Main { return Darwin.sqrt(self.__castToMain)  }

}

extension InternalFloatingPointMathTyping where Main == Float, Alternative == Double, Avoid == CGFloat  {
    private var __abs:Main  {return Main.abs(self.__castToMain) }
    private var __acos:Main  {return Darwin.acos(self.__castToMain) }
    private var __asin:Main { return Darwin.asin(self.__castToMain)  }
    private var __atan:Main { return Darwin.atan(self.__castToMain)  }
    private func __atan2(rhs:Main) -> Main { return Darwin.atan2(self.__castToMain, rhs) }
    private func __atan2(rhs:Alternative) -> Main { return Darwin.atan2(self.__castToMain, Main(rhs) )}
    private func __atan2(rhs:Avoid) -> Main { return Darwin.atan2(self.__castToMain, Main(rhs) )}
    private var __cos:Main  { return Darwin.cos(self.__castToMain)   }
    private var __sin:Main  { return Darwin.sin(self.__castToMain)   }
    private var __tan:Main  { return Darwin.tan(self.__castToMain)   }
    private var __exp:Main  { return Darwin.exp(self.__castToMain)   }
    private var __exp2:Main { return Darwin.exp2(self.__castToMain)  }
    private var __log:Main  { return Darwin.log(self.__castToMain)   }
    private var __log10:Main{ return Darwin.log10(self.__castToMain) }
    private var __log2:Main { return Darwin.log2(self.__castToMain)  }
    private func __pow(rhs:Main)-> Main { return Darwin.pow(self.__castToMain, rhs) }
    private func __pow(rhs:Alternative)-> Main { return Darwin.pow(self.__castToMain, Main(rhs)) }
    private func __pow(rhs:Avoid)-> Main { return Darwin.pow(self.__castToMain, Main(rhs)) }
    private var __sqrt:Main { return Darwin.sqrt(self.__castToMain)  }

    
}



public protocol FloatingPointOperating {
    
    typealias Main
    typealias Alternative
    typealias Avoid
    
    
    var abs:Main   {get}
    var acos:Main  {get}
    var asin:Main  {get}
    var atan:Main  {get}
    func atan2(x:Main) -> Main
    func atan2(x:Alternative) -> Main
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

public protocol zample {
  
}



extension Double : InternalFloatingPointMathTyping {
    public typealias Main = Double
    public typealias Alternative = CGFloat
    public typealias Avoid = Float
    public var toCGFloat:Alternative  { return Alternative(self) }
    
}

extension Float : InternalFloatingPointMathTyping {
    public typealias Main = Float
    public typealias Alternative = Double
    public typealias Avoid = CGFloat
    public var toDouble:Alternative  { return Alternative(self) }
    public var toCGFloat:Avoid  { return Avoid(self) }
}



public extension CGFloat {
    public typealias Main = CGFloat
    public typealias Alternative = Double
    public typealias Avoid = Float
    public var toDouble:Alternative  { return Alternative(self) }
}




private extension FloatingPointOperating {
    var castToMain:Main { return self as! Main }
    var castToAlternative:Alternative { return self as! Alternative }
}



public extension FloatingPointOperating where Main == Double, Alternative == CGFloat, Avoid == Float  {
    public var toCGFloat:Alternative  { return Alternative(self.castToMain) }
    
    public var abs:Main  { return self.castToMain.__abs }
    public var acos:Main { return self.castToMain.__acos  }
    public var asin:Main { return self.castToMain.__asin  }
    public var atan:Main { return self.castToMain.__atan  }
    public func atan2(rhs:Main) -> Main { return self.castToMain.__atan2(rhs) }
    public func atan2(rhs:Alternative) -> Main { return Darwin.atan2(self.castToMain, Main(rhs) )}
    public var cos:Main  { return self.castToMain.__cos   }
    public var sin:Main  { return self.castToMain.__sin   }
    public var tan:Main  { return self.castToMain.__tan   }
    public var exp:Main  { return self.castToMain.__exp  }
    public var exp2:Main { return self.castToMain.__exp2 }
    public var log:Main  { return self.castToMain.__log   }
    public var log10:Main{ return self.castToMain.__log10 }
    public var log2:Main { return self.castToMain.__log2  }
    public func pow(rhs:Main)-> Main { return self.castToMain.__pow(rhs) }
    public func pow(rhs:Alternative)-> Main { return self.castToMain.__pow(rhs) }
    public var sqrt:Main { return self.castToMain.__sqrt  }
    
}

public extension FloatingPointOperating where Main == Float, Alternative == Double, Avoid == CGFloat  {
    public var toDouble:Alternative  { return Alternative(self.castToMain) }

    public var abs:Main  { return self.castToMain.__abs }
    public var acos:Main { return self.castToMain.__acos  }
    public var asin:Main { return self.castToMain.__asin  }
    public var atan:Main { return self.castToMain.__atan  }
    public func atan2(rhs:Main) -> Main { return self.castToMain.__atan2(rhs) }
    public func atan2(rhs:Alternative) -> Main { return self.castToMain.__atan2(Main(rhs)) }
    public var cos:Main  { return self.castToMain.__cos   }
    public var sin:Main  { return self.castToMain.__sin   }
    public var tan:Main  { return self.castToMain.__tan   }
    public var exp:Main  { return self.castToMain.__exp  }
    public var exp2:Main { return self.castToMain.__exp2 }
    public var log:Main  { return self.castToMain.__log   }
    public var log10:Main{ return self.castToMain.__log10 }
    public var log2:Main { return self.castToMain.__log2  }
    public func pow(rhs:Main)-> Main { return self.castToMain.__pow(rhs) }
    public func pow(rhs:Alternative)-> Main { return self.castToMain.__pow(rhs) }
    public func pow(rhs:Avoid)-> Main { return self.castToMain.__pow(rhs) }
    public var sqrt:Main { return self.castToMain.__sqrt  }

}


public extension FloatingPointOperating where Main == CGFloat, Alternative == Double, Avoid == Float  {
    public var toDouble:Alternative  { return Alternative(self.castToMain) }
    
    public var abs:Main  { return self.castToMain.native.__abs.toCGFloat }
    public var acos:Main { return self.castToMain.native.__acos.toCGFloat  }
    public var asin:Main { return self.castToMain.native.__asin.toCGFloat  }
    public var atan:Main { return self.castToMain.native.__atan.toCGFloat  }
    public func atan2(rhs:Main) -> Main { return self.castToMain.native.__atan2(rhs).toCGFloat }
    public func atan2(rhs:Alternative) -> Main { return self.castToMain.native.__atan2(Main(rhs)).toCGFloat }
    public var cos:Main  { return self.castToMain.native.__cos.toCGFloat   }
    public var sin:Main  { return self.castToMain.native.__sin.toCGFloat   }
    public var tan:Main  { return self.castToMain.native.__tan.toCGFloat   }
    public var exp:Main  { return self.castToMain.native.__exp.toCGFloat  }
    public var exp2:Main { return self.castToMain.native.__exp2.toCGFloat }
    public var log:Main  { return self.castToMain.native.__log.toCGFloat   }
    public var log10:Main{ return self.castToMain.native.__log10.toCGFloat }
    public var log2:Main { return self.castToMain.native.__log2.toCGFloat  }
    public func pow(rhs:Main)-> Main { return self.castToMain.native.__pow(rhs).toCGFloat }
    public func pow(rhs:Alternative)-> Main { return self.castToMain.native.__pow(rhs).toCGFloat }
    public var sqrt:Main { return self.castToMain.native.__sqrt.toCGFloat }
    
}



public protocol IntegerToFloatTypeConvertible  {
  var toDouble:Double { get }
}

public protocol SignedIntegerToIntConvertible  {
  var toInt:Int { get }
}


extension Int : IntegerToFloatTypeConvertible { public var toDouble:Double { return Double(self) } }
extension Int8 : IntegerToFloatTypeConvertible { public var toDouble:Double { return Double(self) } }
extension Int16 : IntegerToFloatTypeConvertible { public var toDouble:Double { return Double(self) } }
extension Int32 : IntegerToFloatTypeConvertible { public var toDouble:Double { return Double(self) } }
extension Int64 : IntegerToFloatTypeConvertible { public var toDouble:Double { return Double(self) } }

extension Int : SignedIntegerToIntConvertible { public var toInt:Int { return Int(self) } }
extension Int8 : SignedIntegerToIntConvertible { public var toInt:Int { return Int(self) } }
extension Int16 : SignedIntegerToIntConvertible { public var toInt:Int { return Int(self) } }
extension Int32 : SignedIntegerToIntConvertible { public var toInt:Int { return Int(self) } }
extension Int64 : SignedIntegerToIntConvertible { public var toInt:Int { return Int(self) } }


//
//func + <T:ScalarIntegerType>(lhs:T, rhs:Int) -> Int { return lhs + rhs }
//func + <T:ScalarIntegerType>(lhs:Int, rhs:T) -> Int { return lhs + rhs.toInt }
//
//func - <T:ScalarIntegerType>(lhs:T, rhs:Int) -> Int { return lhs.toInt - rhs }
//func - <T:ScalarIntegerType>(lhs:Int, rhs:T) -> Int { return lhs - rhs.toInt }
//
//func * <T:ScalarIntegerType>(lhs:T, rhs:Int) -> Int { return lhs.toInt * rhs }
//func * <T:ScalarIntegerType>(lhs:Int, rhs:T) -> Int { return lhs * rhs.toInt }
//
//func / <T:ScalarIntegerType>(lhs:T, rhs:Int) -> Int { return lhs.toInt / rhs }
//func / <T:ScalarIntegerType>(lhs:Int, rhs:T) -> Int { return lhs / rhs.toInt }
//
//
//
////Equality T<===>T
//func == <T:ScalarFloatingPointType, U:ScalarFloatingPointType> (lhs:U,rhs:T) -> Bool { return (lhs.toDouble == rhs.toDouble) }
//func == <T:ScalarFloatingPointType> (lhs:Double,rhs:T) -> Bool { return (lhs == rhs.toDouble) }
//func == <T:ScalarFloatingPointType> (lhs:T,rhs:Double) -> Bool { return (lhs.toDouble == rhs) }
//
//func != <T:ScalarFloatingPointType, U:ScalarFloatingPointType> (lhs:U,rhs:T) -> Bool { return (lhs.toDouble == rhs.toDouble) == false }
//func != <T:ScalarFloatingPointType> (lhs:Double,rhs:T) -> Bool { return (lhs == rhs.toDouble) == false }
//func != <T:ScalarFloatingPointType> (lhs:T,rhs:Double) -> Bool { return (lhs.toDouble == rhs) == false }
//
//func <= <T:ScalarFloatingPointType, U:ScalarFloatingPointType> (lhs:T,rhs:U) -> Bool { return (lhs.toDouble <= rhs.toDouble) }
//func <= <T:ScalarFloatingPointType> (lhs:Double, rhs:T) -> Bool { return (lhs <= rhs.toDouble) }
//func <= <T:ScalarFloatingPointType> (lhs:T,rhs:Double) -> Bool { return (lhs.toDouble <= rhs) }
//
//func < <T:ScalarFloatingPointType, U:ScalarFloatingPointType> (lhs:T,rhs:U) -> Bool { return (lhs.toDouble <  rhs.toDouble) }
//func < <T:ScalarFloatingPointType> (lhs:Double, rhs:T) -> Bool { return (lhs <  rhs.toDouble) }
//func < <T:ScalarFloatingPointType> (lhs:T,rhs:Double) -> Bool { return (lhs.toDouble <  rhs) }
//
//func >  <T:ScalarFloatingPointType, U:ScalarFloatingPointType> (lhs:T,rhs:U) -> Bool { return (lhs <= rhs) == false }
//func >  <T:ScalarFloatingPointType> (lhs:Double, rhs:T) -> Bool { return (lhs <= rhs) == false}
//func >  <T:ScalarFloatingPointType> (lhs:T,rhs:Double) -> Bool { return (lhs <= rhs) == false }
//
//func >= <T:ScalarFloatingPointType, U:ScalarFloatingPointType> (lhs:T,rhs:U) -> Bool { return (lhs < rhs) == false }
//func >= <T:ScalarFloatingPointType> (lhs:Double, rhs:T) -> Bool { return (lhs < rhs) == false }
//func >= <T:ScalarFloatingPointType> (lhs:T,rhs:Double) -> Bool { return (lhs < rhs) == false }
//
//
//
////SUBTRACTION
//func - <T:ScalarFloatingPointType, U:ScalarFloatingPointType>(lhs:U, rhs:T) -> Double  {return (lhs.toDouble - rhs.toDouble) }
//func - <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> T  { return T(lhs - rhs.toDouble) }
//func - <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> T  { return T(lhs.toDouble - rhs) }
//func - <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> Double  { return (lhs - rhs.toDouble) }
//func - <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> Double  { return (lhs.toDouble - rhs) }
//func -= <T:ScalarFloatingPointType, U:ScalarFloatingPointType>(inout lhs:T, rhs:U) { lhs = T(lhs.toDouble - rhs.toDouble) }
//func -= <T:ScalarFloatingPointType>(inout lhs:Double, rhs:T)  { lhs = lhs - rhs.toDouble }
//
////ADDITION

func + <LHS:FloatingPointOperating, RHS:FloatingPointOperating
  where
  LHS.Main == Double, LHS.Alternative == CGFloat, LHS.Avoid == Float,
  RHS.Main == CGFloat, RHS.Alternative == Double, RHS.Avoid == Float>
  (lhs:LHS, rhs:RHS) -> LHS.Main  {return lhs.castToMain + rhs.toDouble }

func + <LHS:FloatingPointOperating, RHS:FloatingPointOperating
  where
  LHS.Main == Double, LHS.Alternative == CGFloat, LHS.Avoid == Float,
  RHS.Main == CGFloat, RHS.Alternative == Double, RHS.Avoid == Float>
  (lhs:LHS, rhs:RHS) -> RHS.Main  {return (lhs.castToMain + rhs.toDouble).toCGFloat }


func + <LHS:FloatingPointOperating, RHS:FloatingPointOperating
  where
  LHS.Main == CGFloat, LHS.Alternative == Double, LHS.Avoid == Float,
  RHS.Main == Double, RHS.Alternative == CGFloat, RHS.Avoid == Float>
  (lhs:LHS, rhs:RHS) -> LHS.Main  {return lhs.castToMain + rhs.toCGFloat }


func + <LHS:FloatingPointOperating, RHS:FloatingPointOperating
  where
  LHS.Main == CGFloat, LHS.Alternative == Double, LHS.Avoid == Float,
  RHS.Main == Double, RHS.Alternative == CGFloat, RHS.Avoid == Float>
  (lhs:LHS, rhs:RHS) -> RHS.Main  {return (lhs.castToMain + rhs.toCGFloat).toDouble }



//func + <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> T  { return T(lhs + rhs.toDouble) }
//func + <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> T  { return T(lhs.toDouble + rhs) }
//func + <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> Double  { return (lhs + rhs.toDouble) }
//func + <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> Double  { return (lhs.toDouble + rhs) }
//func += <T:ScalarFloatingPointType, U:ScalarFloatingPointType>(inout lhs:T, rhs:U) { lhs = T(lhs.toDouble + rhs.toDouble) }
//func += <T:ScalarFloatingPointType>(inout lhs:Double, rhs:T)  { lhs = lhs + rhs.toDouble }
//
////MULTIPLICATION
//func * <T:ScalarFloatingPointType, U:ScalarFloatingPointType>(lhs:U, rhs:T) -> Double  {return (lhs.toDouble * rhs.toDouble) }
//func * <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> T  { return T(lhs * rhs.toDouble) }
//func * <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> T  { return T(lhs.toDouble * rhs) }
//func * <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> Double  { return (lhs * rhs.toDouble) }
//func * <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> Double  { return (lhs.toDouble * rhs) }
//func *= <T:ScalarFloatingPointType, U:ScalarFloatingPointType>(inout lhs:T, rhs:U) { lhs = T(lhs.toDouble * rhs.toDouble) }
//func *= <T:ScalarFloatingPointType>(inout lhs:Double, rhs:T)  { lhs = lhs * rhs.toDouble }
//
////DIVISION
//func / <T:ScalarFloatingPointType, U:ScalarFloatingPointType>(lhs:U, rhs:T) -> Double  {return (lhs.toDouble / rhs.toDouble) }
//func / <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> T  { return T(lhs / rhs.toDouble) }
//func / <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> T  { return T(lhs.toDouble / rhs) }
//func / <T:ScalarFloatingPointType>(lhs:Double, rhs:T) -> Double  { return (lhs / rhs.toDouble) }
//func / <T:ScalarFloatingPointType>(lhs:T, rhs:Double) -> Double  { return (lhs.toDouble / rhs) }
//func /= <T:ScalarFloatingPointType, U:ScalarFloatingPointType>(inout lhs:T, rhs:U) { lhs = T(lhs.toDouble / rhs.toDouble) }
//func /= <T:ScalarFloatingPointType>(inout lhs:Double, rhs:T)  { lhs = lhs / rhs.toDouble }


