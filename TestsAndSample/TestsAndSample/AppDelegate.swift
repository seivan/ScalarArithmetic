//
//  AppDelegate.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 29/06/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import UIKit
import Darwin


//extension FloatLiteralConvertible where Self.FloatLiteralType == Double {
//    func toCGFloat() -> CGFloat {
//        return  2.2 //Double(Stride) //CGFloat(self as! Double)
//    }
//
//}
//
//
//extension FloatLiteralConvertible where Self.FloatLiteralType == Float {
//    func toDouble() -> Double {
//        return Double(self as! Float)
//    }
//    
//}

//
//extension Double : FloatingPointMathType {
//    public typealias ItemType = Double
//
//}
////
//extension CGFloat : FloatingPointMathType {
//    public typealias ItemType = CGFloat
//}
//
//func + <T:FloatingPointMathType, U:FloatingPointMathType where U.ItemType == CGFloat, T.ItemType == Double>(lhs:T,rhs:U) -> T { return (lhs + rhs) }
//func + <T:FloatingPointMathType, U:FloatingPointMathType where U.ItemType == CGFloat, T.ItemType == Double>(lhs:U,rhs:T) -> U { return (lhs + rhs) }

//public protocol FloatingPointMathType {
//    typealias ItemType
//
//}
//
//
//extension CGFloat : FloatingPointMathType {
//    public typealias ItemType = CGFloat
//
//}
//
//extension Double : FloatingPointMathType {
//    public typealias ItemType = Double
//    
//}
////
//func + <L:FloatingPointMathType, R:FloatingPointMathType
//    where L.ItemType == Double, R.ItemType == CGFloat >(lhs:L, rhs:R) -> L.ItemType { return 2.2 + 2.2 }
//


//
//    public init<T:FloatingPointType
//        where T.Stride == CGFloat>(_ value: T) {
//        self.init(value)
//    }

//protocol FloatingPointMathType {
//    var acos:Self {get}
//}
//
//extension FloatLiteralConvertible where Self.FloatLiteralType : FloatingPointMathType {
//    
//}

//extension FloatingPointMathType where Self : FloatingPointType, Self.Stride == Double {
//    var acos:Stride     { return Darwin.acos(self as! Double) }
//
//}
//extension Double : FloatingPointMathType {}



//extension FloatingPointType {
//    typealias ItemType = Self.Stride
//    var abs:ItemType      { return self.abs  }

//    var acos:ItemType     { return ItemType(Darwin.acos(self)) }
    
//    var asin:ItemType     { return CGFloat(Darwin.asin(Double(self))) }
//    var atan:ItemType     { return CGFloat(Darwin.atan(Double(self))) }
//    func atan2(x:ItemType) -> CGFloat { return CGFloat(Darwin.atan2(Double(self), Double(x))) }
//    var cos:ItemType      { return CGFloat(Darwin.cos(Double(self))) }
//    var sin:ItemType      { return CGFloat(Darwin.sin(Double(self))) }
//    var tan:ItemType      { return CGFloat(Darwin.tan(Double(self))) }
//    var exp:ItemType      { return CGFloat(Darwin.exp(Double(self))) }
//    var exp2:ItemType     { return CGFloat(Darwin.exp2(Double(self))) }
//    var log:ItemType      { return CGFloat(Darwin.log(Double(self))) }
//    var log10:ItemType    { return CGFloat(Darwin.log10(Double(self))) }
//    var log2:ItemType     { return CGFloat(Darwin.log2(Double(self))) }
//    func pow(exponent:ItemType)-> ItemType { return CGFloat(Darwin.pow(Double(self), Double(exponent))) }
//    var sqrt:ItemType     { return CGFloat(Darwin.sqrt(Double(self))) }
//
//}

//

//private extension FloatingPointType where Self.Stride == CGFloat {
//    init<U:FloatingPointType where U.Stride == CGFloat>(_ value: U) {
//        self.init(value)
//    }
//
//}
//
//private extension CGFloat {
//    init<U:FloatingPointType where U.Stride == Double>(_ value: U) {
//        self.init(value)
//    }
//    
//}
//
//
//extension FloatingPointType where Self.Stride : FloatingPointMathType {
//    
//}
//
//
//public extension FloatingPointType where Self.Stride == CGFloat {
////    final var toDouble:Double { return Double(self) }
//}
//
//public extension FloatingPointType where Self.Stride == Double {
//    final var toCGFloat:CGFloat { return CGFloat(self) }
//}

//
//public extension FloatingPointType where Self : Double {
//
//}
//
//

//public func + <L:FloatingPointType, R:FloatingPointType
//    where L.Stride == Double, R.Stride == CGFloat>(lhs:L, rhs:R) -> L.Stride { return lhs.asDouble + rhs.toDouble }
//

//public func +(lhs:Double, rhs:CGFloat) -> Double { return lhs + Double(rhs) }
//public func +(lhs:CGFloat, rhs:Double) -> CGFloat { return CGFloat(lhs) + rhs }



func acceptingCG(crap:CGFloat) {
    
}

func acceptingD(crap:Double) {
    
}
func acceptingF(crap:Double) {
    
}





@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
  var window: UIWindow?

  
  
  
  

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
    self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
    // Override point for customization after application launch.
    self.window!.backgroundColor = UIColor.whiteColor()
    self.window!.makeKeyAndVisible()

        
//        let f:Float = Float(5.5)
//        let d:Double = Double(5.5)
//
//        let cg:CGFloat = CGFloat(5.5)
//        let i:Int = Int(5)
        
//        let qert = d.acos
//        acceptingD(qert)
//        acceptingD(d)
//        acceptingD(d.acos)
        
        
        
        
//        d + cg
//        cg + d
//        
        
//        print(p)
        
//        d.toCGFloat()
//        f.toDouble()
//        cg.toDouble()
        
//        accepting(cg.toDouble())
//        acceptingCG(d)
//        acceptingD(f)
//        acceptingD(cg)
        
//        let _ = f + d
//        let _ = f + cg
//        let _ = f + i
//        
//        let _ = d + f
//        let _ = cg + f
//        let _ = i + f

        
//          let successShouldBeCGFloat = cg + d
//          let successShouldBeDouble = d + cg
//        
//        print(success)
//        let x = 5+5.5
//        var damn:CGFloat = 2;

        
        

//    var floatValue:Float        = 5.0
//    var doubleValue:Double      = 5.0
//    var cgFloatValue:CGFloat    = 5.0
//    var intValue:Int            = Int(5)
//    var int16Value:Int16        = 5
//    var int32Value:Int32        = 5
//    var int64Value:Int64        = 5
//    var uInt16Value:UInt16      = 5
//    var uInt32Value:UInt32      = 5
//    var uInt64Value:UInt64      = 5
    

//    cgFloatValue = cgFloatValue.atan2(doubleValue)
//    cgFloatValue = cgFloatValue.atan2(cgFloatValue)
//    cgFloatValue = doubleValue.atan2(doubleValue)
//    cgFloatValue = doubleValue.atan2(cgFloatValue)
//
//    
//    
//    doubleValue = cgFloatValue.atan2(doubleValue)
//    doubleValue = cgFloatValue.atan2(cgFloatValue)
//    doubleValue = doubleValue.atan2(doubleValue)
//    doubleValue = doubleValue.atan2(cgFloatValue)
//
//    doubleValue = asin(doubleValue)
////    cgFloatValue = intValue
//    cgFloatValue = doubleValue
//
//    doubleValue = intValue
//    doubleValue = cgFloatValue
//    
//    doubleValue = doubleValue + intValue
//    doubleValue = doubleValue + cgFloatValue
//    doubleValue = doubleValue + floatValue
//
//    doubleValue = intValue + doubleValue
//    doubleValue = cgFloatValue + doubleValue
//    doubleValue = floatValue + doubleValue
//
//
//    doubleValue = intValue + cgFloatValue
//    doubleValue = intValue + floatValue
//    doubleValue = floatValue + cgFloatValue
//    doubleValue = floatValue + intValue
//    doubleValue = cgFloatValue + floatValue
//    doubleValue = cgFloatValue + intValue
//    
//    doubleValue += intValue
//    doubleValue += cgFloatValue
//    doubleValue += floatValue
//
//    /////////////////////
//
//    cgFloatValue = cgFloatValue + doubleValue
//    cgFloatValue = cgFloatValue + intValue
//    cgFloatValue = cgFloatValue + floatValue
//
//
//    cgFloatValue = doubleValue + cgFloatValue
//    cgFloatValue = intValue + cgFloatValue
//    cgFloatValue = floatValue + cgFloatValue
//
//    cgFloatValue = intValue + doubleValue
//    cgFloatValue = intValue + floatValue
//    cgFloatValue = floatValue + doubleValue
//    cgFloatValue = floatValue + intValue
//    cgFloatValue = doubleValue + floatValue
//    cgFloatValue = doubleValue + intValue
//
//    
//    cgFloatValue += doubleValue
//    cgFloatValue += intValue
//    cgFloatValue += floatValue
//    
//    
///////////////////////
//    
//    doubleValue == doubleValue
//    doubleValue == cgFloatValue
//    doubleValue == intValue
//    
//    cgFloatValue == doubleValue
//    cgFloatValue == intValue
//    intValue == doubleValue
//    intValue == cgFloatValue
//
//
//    doubleValue != doubleValue
//    doubleValue != cgFloatValue
//    doubleValue != intValue
//    
//    cgFloatValue != doubleValue
//    cgFloatValue != intValue
//    intValue != doubleValue
//    intValue != cgFloatValue
//
//    
//    doubleValue >= doubleValue
//    doubleValue >= cgFloatValue
//    doubleValue >= intValue
//    
//    cgFloatValue >= doubleValue
//    cgFloatValue >= intValue
//    intValue >= doubleValue
//    intValue >= cgFloatValue
//
//    doubleValue > doubleValue
//    doubleValue > cgFloatValue
//    doubleValue > intValue
//    
//    cgFloatValue > doubleValue
//    cgFloatValue > intValue
//    intValue > doubleValue
//    intValue > cgFloatValue
//
//    
//    doubleValue <= doubleValue
//    doubleValue <= cgFloatValue
//    doubleValue <= intValue
//    
//    cgFloatValue <= doubleValue
//    cgFloatValue <= intValue
//    intValue <= doubleValue
//    intValue <= cgFloatValue
//
//    
//    doubleValue < doubleValue
//    doubleValue < cgFloatValue
//    doubleValue < intValue
//    
//    cgFloatValue < doubleValue
//    cgFloatValue < intValue
//    intValue < doubleValue
//    intValue < cgFloatValue
//
//
//    
//    
// 
//    doubleValue = doubleValue + int16Value
//    doubleValue = doubleValue + int32Value
//    doubleValue = doubleValue + int64Value
//    
//    doubleValue = doubleValue + uInt16Value
//    doubleValue = doubleValue + uInt32Value
//    doubleValue = doubleValue + uInt64Value
//
//    cgFloatValue = cgFloatValue + int16Value
//    cgFloatValue = cgFloatValue + int32Value
//    cgFloatValue = cgFloatValue + int64Value
//
//    cgFloatValue = cgFloatValue + uInt16Value
//    cgFloatValue = cgFloatValue + uInt32Value
//    cgFloatValue = cgFloatValue + uInt64Value
    
//    intValue > int64Value
    

//    CGPoint(x: 20.5, y: 20.5)
//    CGPoint(x: doubleValue, y: doubleValue)
    
    return true
  }

  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

