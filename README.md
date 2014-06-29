#ScalarArithmetic

### Overview

Adds math functions as properties and takes care of operators for interacting between different types of scalars.
This library makes it easier to compare to ```Int```, ```Float``` and ```CGFloat``` regardless of architecture.

``var myDouble = 2.0`` will give you a ```Double``` and you'd want to use that with other types. 

Since ```CGFloat``` is not a ```Double``` on 32bit, it becomes hard to use CGGeomtry and frameworks like CoreGraphics or SpriteKite. This library makes it a but less painful and hopefully Apple takes care of it soon. 

Works on both Mac OS and iOS.

### Math Functions
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