#ScalarArithmetic

### Overview

Adds math functions as properties and makes it easier to just use type inference from Double.
``var = 2.0`` will give you a double
and this library makes it easier to compare to ```Int```, ```Float``` and ```CGFloat``` regardless of architecture.
Naturally this library is only necessary until Apple takes care of the quirks. Works on both Mac OS and iOS.


### Usage
```swift
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

```


###Contact


If you end up using ScalarArithmetic in a project, I'd love to hear about it.

email: [seivan.heidari@icloud.com](mailto:seivan.heidari@icloud.com)  
twitter: [@seivanheidari](https://twitter.com/seivanheidari)

***

### License

ScalarArithmetic is © 2014 [Seivan](http://www.github.com/seivan) and may be freely
distributed under the [MIT license](http://opensource.org/licenses/MIT).
See the [`LICENSE.md`](https://github.com/seivan/ScalarArithmetic/blob/master/LICENSE.md) file.

*** 