
import CoreGraphics

extension CGFloat {
  func __conversion() -> Double {
    return Double(self)
  }
}

extension Double {
  func __conversion() -> CGFloat {
    return CGFloat(self)
  }
  
}

extension Int {
   func __conversion() -> Double {
    return Double(self)
  }
  
}

extension Int16 {
   func __conversion() -> Int {
    return Int(self)
  }
  func __conversion() -> Double {
    return Double(self)
  }

}

extension Int32 {
   func __conversion() -> Int {
    return Int(self)
  }
  func __conversion() -> Double {
    return Double(self)
  }

  
}

extension Int64 {
   func __conversion() -> Int {
    return Int(self)
  }
  func __conversion() -> Double {
    return Double(self)
  }

  
}


extension UInt16 {
   func __conversion() -> Int {
    return Int(self)
  }
  func __conversion() -> Double {
    return Double(self)
  }

  
}

extension UInt32 {
   func __conversion() -> Int {
    return Int(self)
  }
  
  func __conversion() -> Double {
    return Double(self)
  }

  
  
}

extension UInt64 {
   func __conversion() -> Int {
    return Int(self)
  }
  
  func __conversion() -> Double {
    return Double(self)
  }

    
}

