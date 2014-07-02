

#if !(arch(x86_64) || arch(arm64))
import CoreGraphics
extension Int {
  @conversion func __conversion() -> CGFloat {
    return CGFloat(self)
  }
}
extension CGFloat {
  @conversion func __conversion() -> Double {
    return Double(self)
  }
}

#endif
extension Int {
  @conversion func __conversion() -> Double {
    return Double(self)
  }
}

