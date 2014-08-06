#ScalarArithmetic

### Why?
* Because I don't need explicit casts to ```Double``` if I am expecting a ```Double```.
* ```5 + 5.0 ``` should return a ```Double```
```swift
//You can now compare or do mathematical operations between the following types: 
    var doubleValue:Double      = 5.0
    var cgFloatValue:CGFloat    = 5.0
    var intValue:Int            = 5
    var int16Value:Int16        = 5
    var int32Value:Int32        = 5
    var int64Value:Int64        = 5
    var uInt16Value:UInt16      = 5
    var uInt32Value:UInt32      = 5
    var uInt64Value:UInt64      = 5
````

To see what is fully possible. Run the test suite, then comment out ScalarArithmetic and try to run the test suite again.


### Overview

Takes care of operators for interacting between different types of scalars.
This library makes it easier to compare to ```Int```, ```Float``` and ```CGFloat``` regardless of architecture.

This also makes implicit casts to Double or CGFloat for arguments or variables that takes either types. 

``var myDouble = 2.0`` will give you a ```Double``` and you'd want to use that with other types. 

Works on both Mac OS and iOS.



### Math Functions

```swift
protocol FloatingPointMathType {
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

```

### Sample 

```swift
    cgFloatValue = doubleValue

    doubleValue = intValue
    doubleValue = cgFloatValue
    
    doubleValue = doubleValue + intValue
    doubleValue = doubleValue + cgFloatValue
    doubleValue = doubleValue + floatValue

    doubleValue = intValue + doubleValue
    doubleValue = cgFloatValue + doubleValue
    doubleValue = floatValue + doubleValue


    doubleValue = intValue + cgFloatValue
    doubleValue = intValue + floatValue
    doubleValue = floatValue + cgFloatValue
    doubleValue = floatValue + intValue
    doubleValue = cgFloatValue + floatValue
    doubleValue = cgFloatValue + intValue
    
    doubleValue += intValue
    doubleValue += cgFloatValue
    doubleValue += floatValue

    /////////////////////

    cgFloatValue = cgFloatValue + doubleValue
    cgFloatValue = cgFloatValue + intValue
    cgFloatValue = cgFloatValue + floatValue


    cgFloatValue = doubleValue + cgFloatValue
    cgFloatValue = intValue + cgFloatValue
    cgFloatValue = floatValue + cgFloatValue

    cgFloatValue = intValue + doubleValue
    cgFloatValue = intValue + floatValue
    cgFloatValue = floatValue + doubleValue
    cgFloatValue = floatValue + intValue
    cgFloatValue = doubleValue + floatValue
    cgFloatValue = doubleValue + intValue

    
    cgFloatValue += doubleValue
    cgFloatValue += intValue
    cgFloatValue += floatValue
    
    
/////////////////////
    
    doubleValue == doubleValue
    doubleValue == cgFloatValue
    doubleValue == intValue
    
    cgFloatValue == doubleValue
    cgFloatValue == intValue
    intValue == doubleValue
    intValue == cgFloatValue


    doubleValue != doubleValue
    doubleValue != cgFloatValue
    doubleValue != intValue
    
    cgFloatValue != doubleValue
    cgFloatValue != intValue
    intValue != doubleValue
    intValue != cgFloatValue

    
    doubleValue >= doubleValue
    doubleValue >= cgFloatValue
    doubleValue >= intValue
    
    cgFloatValue >= doubleValue
    cgFloatValue >= intValue
    intValue >= doubleValue
    intValue >= cgFloatValue

    doubleValue > doubleValue
    doubleValue > cgFloatValue
    doubleValue > intValue
    
    cgFloatValue > doubleValue
    cgFloatValue > intValue
    intValue > doubleValue
    intValue > cgFloatValue

    
    doubleValue <= doubleValue
    doubleValue <= cgFloatValue
    doubleValue <= intValue
    
    cgFloatValue <= doubleValue
    cgFloatValue <= intValue
    intValue <= doubleValue
    intValue <= cgFloatValue

    
    doubleValue < doubleValue
    doubleValue < cgFloatValue
    doubleValue < intValue
    
    cgFloatValue < doubleValue
    cgFloatValue < intValue
    intValue < doubleValue
    intValue < cgFloatValue

    doubleValue = doubleValue + int16Value
    doubleValue = doubleValue + int32Value
    doubleValue = doubleValue + int64Value
    
    doubleValue = doubleValue + uInt16Value
    doubleValue = doubleValue + uInt32Value
    doubleValue = doubleValue + uInt64Value

    cgFloatValue = cgFloatValue + int16Value
    cgFloatValue = cgFloatValue + int32Value
    cgFloatValue = cgFloatValue + int64Value

    cgFloatValue = cgFloatValue + uInt16Value
    cgFloatValue = cgFloatValue + uInt32Value
    cgFloatValue = cgFloatValue + uInt64Value

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
