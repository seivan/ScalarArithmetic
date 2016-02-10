

import Darwin
import CoreGraphics


protocol ScalarFloatingPointType {
    var toDouble:Double { get }
    init(_ value:Double)
}


public protocol FloatingPointMathType {
    typealias Main : FloatingPointType
    typealias Alternative : FloatingPointType
    typealias Avoid : FloatingPointType
    
    var toMain:Main {get}
    var toAlternative:Alternative {get}
    var abs:Main   {get}
//    var acos:Main  {get}
//    var asin:Main  {get}
//    var atan:Main  {get}
//    func atan2(x:Main) -> Main
//    func atan2(x:Alternative) -> Main
//    var cos:Main   {get}
//    var sin:Main   {get}
//    var tan:Main   {get}
//    var exp:Main   {get}
//    var exp2:Main  {get}
//    var log:Main   {get}
//    var log10:Main {get}
//    var log2:Main  {get}
//    func pow(exponent:Main) -> Main
//    func pow(exponent:Alternative) -> Main
//    var sqrt:Main  {get}
}


extension CGFloat : FloatingPointMathType {
    public var toMain:Main  { return Main(self) }
    public var toAlternative:Alternative  { return Alternative(self) }

}

extension Double : FloatingPointMathType {
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
    public func pow(exponent:Main)-> Main { return Darwin.pow(self, exponent) }
    public func pow(exponent:Alternative)-> Main { return Darwin.pow(self, exponent.toMain) }
    public var sqrt:Main { return Darwin.sqrt(self)  }

}


extension CGFloat : FloatingPointMathType {
    public typealias Main = CGFloat
    public typealias Alternative = Double
    public typealias Avoid = Float
    
//    init<T : FloatingPointMathType where T.Main == CGFloat>(_ arg:T) {
//        self.init(arg as! T.Main)
//    }
}

//extension Double :  FloatingPointMathType {
//    public typealias Main = Double
//    public typealias Alternative = CGFloat
//    public typealias Avoid = Float
//    
//    public var toCGFloat:Alternative  { return Alternative(self) }
//    
//    public var abs:Main  { return Double.abs(self)   }
//    public var acos:Main { return Darwin.acos(self)  }
//    public var asin:Main { return Darwin.asin(self)  }
//    public var atan:Main { return Darwin.atan(self)  }
//    public func atan2(x:Main) -> Main { return Darwin.atan2(self,x) }
//    public func atan2(x:Alternative) -> Main { return Darwin.atan2(self,x.toDouble) }
//    public var cos:Main  { return Darwin.cos(self)   }
//    public var sin:Main  { return Darwin.sin(self)   }
//    public var tan:Main  { return Darwin.tan(self)   }
//    public var exp:Main  { return Darwin.exp(self)   }
//    public var exp2:Main { return Darwin.exp2(self)  }
//    public var log:Main  { return Darwin.log(self)   }
//    public var log10:Main{ return Darwin.log10(self) }
//    public var log2:Main { return Darwin.log2(self)  }
//    public func pow(exponent:Main)-> Main { return Darwin.pow(self, exponent) }
//    public func pow(exponent:Alternative)-> Main { return Darwin.pow(self, exponent.toDouble) }
//    public var sqrt:Main { return Darwin.sqrt(self)  }
//
//
//    
//}
//



//extension CGFloat : ScalarFloatingPointType, FloatingPointMathType {
//    public typealias Main = CGFloat
//    public typealias Alternative = Double
//    public typealias Avoid = Float
//
//    
//    public var toDouble:Alternative  { return Alternative(self) }
//    
//    public var abs:Main      { return CGFloat.abs(self)  }
////    public var acos:Main     { return self.native.acos.toCGFloat }
//    public var acos:Main     { return self.native.acos.toCGFloat }
//    public var asin:Main     { return self.native.asin.toCGFloat }
//    public var atan:Main     { return self.native.atan.toCGFloat }
//    public func atan2(x:Main) -> Main { return self.native.atan2(x).toCGFloat }
//    public func atan2(x:Alternative) -> Main { return self.native.atan2(x.toCGFloat).toCGFloat }
//    public var cos:Main      { return self.native.cos.toCGFloat }
//    public var sin:Main      { return self.native.sin.toCGFloat }
//    public var tan:Main      { return self.native.tan .toCGFloat }
//    public var exp:Main      { return self.native.exp.toCGFloat }
//    public var exp2:Main     { return self.native.exp2.toCGFloat }
//    public var log:Main      { return self.native.log.toCGFloat }
//    public var log10:Main    { return self.native.log10.toCGFloat }
//    public var log2:Main     { return self.native.log2.toCGFloat }
//    public func pow(exponent:Main)-> Main { return self.native.pow(exponent).toCGFloat }
//    public func pow(exponent:Alternative)-> Main { return self.native.pow(exponent.toCGFloat).toCGFloat }
//    public var sqrt:Main     { return self.native.acos.toCGFloat }
//    
//}
//
//extension Float : ScalarFloatingPointType, FloatingPointMathType {
//    public typealias Main = Float
//    public typealias Alternative = Double
//    public typealias Avoid = CGFloat
//
//    
//    public var toDouble:Alternative    { return Alternative(self) }
//    public var toCGFloat:Avoid         { return Avoid(self) }
//    
//    public var abs:Main  { return Float.abs(self) }
//    public var acos:Main { return Darwin.acos(self)  }
//    public var asin:Main { return Darwin.asin(self)  }
//    public var atan:Main { return Darwin.atan(self)  }
//    public func atan2(x:Main) -> Main { return Darwin.atan2(self,Float(x)) }
//    public func atan2(x:Alternative) -> Main { return Darwin.atan2(self,Float(x)) }
//    public func atan2(x:Avoid) -> Main { return Darwin.atan2(self,Float(x)) }
//    public var cos:Main  { return Darwin.cos(self)   }
//    public var sin:Main  { return Darwin.sin(self)   }
//    public var tan:Main  { return Darwin.tan(self)   }
//    public var exp:Main  { return Darwin.exp(self)   }
//    public var exp2:Main { return Darwin.exp2(self)  }
//    public var log:Main  { return Darwin.log(self)   }
//    public var log10:Main{ return Darwin.log10(self) }
//    public var log2:Main { return Darwin.log2(self)  }
//    public func pow(exponent:Main)-> Main { return Darwin.pow(self, Float(exponent)) }
//    public func pow(exponent:Alternative)-> Main { return Darwin.pow(self, Float(exponent)) }
//    public func pow(exponent:Avoid)-> Main { return Darwin.pow(self, Float(exponent)) }
//    public var sqrt:Main { return Darwin.sqrt(self)  }
//
//    
//}
//
protocol ScalarIntegerType : ScalarFloatingPointType {
    var toInt:Int { get }
}

extension Int : ScalarIntegerType {
    var toDouble:Double { return Double(self) }
    var toInt:Int { return Int(self) }
    
}
extension Int16 : ScalarIntegerType {
    var toDouble:Double { return Double(self) }
    var toInt:Int { return Int(self) }
    
}
extension Int32 : ScalarIntegerType {
    var toDouble:Double { return Double(self) }
    var toInt:Int { return Int(self) }
    
}
extension Int64 : ScalarIntegerType {
    var toDouble:Double { return Double(self) }
    var toInt:Int { return Int(self) }
    
}
extension UInt : ScalarFloatingPointType {
    var toDouble:Double { return Double(self) }
    
}
extension UInt16  : ScalarFloatingPointType {
    var toDouble:Double { return Double(self) }
    
}
extension UInt32 : ScalarFloatingPointType {
    var toDouble:Double { return Double(self) }
}
extension UInt64 : ScalarFloatingPointType {
    var toDouble:Double { return Double(self) }
    
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


