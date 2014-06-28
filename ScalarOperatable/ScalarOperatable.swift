import Darwin
import CoreGraphics

protocol ScalarArithmetic {
  var acos:Self  {get}
  var asin:Self  {get}
  var atan:Self  {get}
  func atan2(x:Self) -> Self
  var cos:Self   {get}
  var sin:Self   {get}
  var tan:Self   {get}
  var exp:Self   {get}
  var exp2:Self  {get}
  var log:Self   {get}
  var log10:Self {get}
  var log2:Self  {get}
  func pow(exponent:Self) -> Self
  var sqrt:Self  {get}
}


extension Double : ScalarArithmetic {
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
}
protocol ScalarOperatable {
  var toDouble:Double { get }
  init(_ value:Double)
}

extension Int : ScalarOperatable {
  var toDouble:Double { return Double(self) }
}

extension Float : ScalarOperatable {
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
}

#if !(arch(x86_64) || arch(arm64))
  
extension CGPoint {
  init(x:Double, y:Double) {
    self.init(x:CGFloat(x), y:CGFloat(y))
  }
}
  
extension CGSize {
  init(width:Double, height:Double) {
    self.init(width:CGFloat(width), height:CGFloat(height))
  }
}
  
extension CGVector {
  init(_ dx:Double, _ dy:Double) {
    self.dx = CGFloat(dx)
  self.dy = CGFloat(dy)
 }
}
#endif


@infix func == <T:ScalarOperatable, U:ScalarOperatable> (lhs:T,rhs:U) -> Bool {
  return (lhs.toDouble == rhs.toDouble)
}
@infix func != <T:ScalarOperatable, U:ScalarOperatable> (lhs:T,rhs:U) -> Bool {
  return (lhs == rhs) == false
}
@infix func <= <T:ScalarOperatable, U:ScalarOperatable> (lhs:T,rhs:U) -> Bool {
  return (lhs.toDouble <= rhs.toDouble)
}
@infix func < <T:ScalarOperatable, U:ScalarOperatable> (lhs:T,rhs:U) -> Bool {
  return (lhs.toDouble <  rhs.toDouble)
}
@infix func >= <T:ScalarOperatable, U:ScalarOperatable> (lhs:T,rhs:U) -> Bool {
  return (lhs < rhs) == false
}
@infix func >  <T:ScalarOperatable, U:ScalarOperatable> (lhs:T,rhs:U) -> Bool {
  return (lhs <= rhs) == false
}

@infix func == <T:ScalarOperatable> (lhs:Double, rhs:T) -> Bool {
  return (lhs == rhs.toDouble)
}
@infix func != <T:ScalarOperatable> (lhs:Double, rhs:T) -> Bool {
  return (lhs == rhs) == false
}
@infix func <= <T:ScalarOperatable> (lhs:Double, rhs:T) -> Bool {
  return (lhs <= rhs.toDouble)
}
@infix func < <T:ScalarOperatable> (lhs:Double, rhs:T) -> Bool {
  return (lhs <  rhs.toDouble)
}
@infix func >= <T:ScalarOperatable> (lhs:Double, rhs:T) -> Bool {
  return (lhs < rhs) == false
}
@infix func >  <T:ScalarOperatable> (lhs:Double, rhs:T) -> Bool {
  return (lhs <= rhs) == false
}


@infix func == <T:ScalarOperatable> (lhs:T,rhs:Double) -> Bool {
  return (lhs.toDouble == rhs)
}
@infix func != <T:ScalarOperatable> (lhs:T,rhs:Double) -> Bool {
  return (lhs == rhs) == false
}
@infix func <= <T:ScalarOperatable> (lhs:T,rhs:Double) -> Bool {
  return (lhs.toDouble <= rhs)
}
@infix func < <T:ScalarOperatable> (lhs:T,rhs:Double) -> Bool {
  return (lhs.toDouble <  rhs)
}
@infix func >= <T:ScalarOperatable> (lhs:T,rhs:Double) -> Bool {
  return (lhs < rhs) == false
}
@infix func >  <T:ScalarOperatable> (lhs:T,rhs:Double) -> Bool {
  return (lhs <= rhs) == false
}


@infix func - <T:ScalarOperatable, U:ScalarOperatable>(lhs: T, rhs:U) -> Double  {
  return lhs.toDouble - rhs.toDouble
}
@infix func - <T:ScalarOperatable>(lhs:Double, rhs:T) -> Double  {
  return lhs - rhs.toDouble
}
@infix func - <T:ScalarOperatable>(lhs:T, rhs:Double) -> Double  {
  return lhs.toDouble - rhs
}
@assignment  @infix func -= <T:ScalarOperatable>(inout lhs:Double, rhs:T)  {
  lhs = lhs - rhs.toDouble
}


@infix func + <T:ScalarOperatable, U:ScalarOperatable>(lhs: T, rhs:U) -> Double  {
  return lhs.toDouble + rhs.toDouble
}
@infix func + <T:ScalarOperatable>(lhs:Double, rhs:T) -> Double  {
  return lhs + rhs.toDouble
}
@infix func + <T:ScalarOperatable>(lhs:T, rhs:Double) -> Double  {
  return lhs.toDouble + rhs
}
@assignment  @infix func += <T:ScalarOperatable>(inout lhs:Double, rhs:T)  {
  lhs = lhs + rhs.toDouble
}

@infix func * <T:ScalarOperatable, U:ScalarOperatable>(lhs: T, rhs:U) -> Double  {
  return lhs.toDouble * rhs.toDouble
}
@infix func * <T:ScalarOperatable>(lhs:Double, rhs:T) -> Double  {
  return lhs * rhs.toDouble
}
@infix func * <T:ScalarOperatable>(lhs:T, rhs:Double) -> Double  {
  return lhs.toDouble * rhs
}
@assignment @infix func *= <T:ScalarOperatable>(inout lhs:Double, rhs:T)  {
  lhs = lhs * rhs.toDouble
}

@infix func / <T:ScalarOperatable, U:ScalarOperatable>(lhs: T, rhs:U) -> Double  {
  return lhs.toDouble / rhs.toDouble
}
@infix func / <T:ScalarOperatable>(lhs: Double, rhs:T) -> Double  {
  return lhs / rhs.toDouble
}
@infix func / <T:ScalarOperatable>(lhs: T, rhs:Double) -> Double  {
  return lhs.toDouble / rhs
}
@assignment @infix func /= <T:ScalarOperatable>(inout lhs:Double, rhs:T)  {
  lhs = lhs / rhs.toDouble
}
