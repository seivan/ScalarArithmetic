SHTestCaseAdditions
==========
[![Build Status](https://travis-ci.org/seivan/SHTestCaseAdditions.png?branch=master)](https://travis-ci.org/seivan/SHTestCaseAdditions)
[![Version](https://cocoapod-badges.herokuapp.com/v/SHTestCaseAdditions/badge.png)](http://cocoadocs.org/docsets/SHTestCaseAdditions)
[![Platform](https://cocoapod-badges.herokuapp.com/p/SHTestCaseAdditions/badge.png)](http://cocoadocs.org/docsets/SHTestCaseAdditions)

Overview
--------
Prefixed Asynchronous test helpers as a category on SenTestCase and XCTestCase

* Swizzle and junk free
* Prefixed selectors.
* Works with both SentTest (Xcode 4) and XCTest (Xcode 5)
* For iOS and Mac OS
* Comes with tests and example. 


Navigation
----------
#### [API](https://github.com/seivan/SHTestCaseAdditions#api-1)
#### [Usage](https://github.com/seivan/SHTestCaseAdditions#usage-1)



Installation
------------

Default is for XCTest

```ruby
pod 'SHTestCaseAdditions'
```

```ruby
pod 'SHTestCaseAdditions/XCTest'
```

For SenTestKit
```ruby
pod 'SHTestCaseAdditions/SenTestKit'
```


***

Setup
-----

Put this either in specific files or your project prefix file

XCTestCase
```objective-c
#import <XCTestCase+SHTestCaseAdditions.h>
```

SenTestKit
```objective-c
#import <SenTestCase+SHTestCaseAdditions.h>
```

or 

```objective-c
#import "SHTestCaseAdditions.h"
```

API
-----

```objective-c


#pragma mark -
#pragma mark Block Definitions
typedef BOOL (^SHTestCaseConditional)();
typedef void (^SHTestCaseBlock)(BOOL *didFinish);

#pragma mark -
#pragma mark Helpers
-(void)SH_waitForTimeInterval:(NSTimeInterval)theTimeInterval;

-(void)SH_runLoopUntilTestPassesWithBlock:(SHTestCaseConditional)theBlock
                              withTimeOut:(NSTimeInterval)theTimeout;

-(void)SH_performAsyncTestsWithinBlock:(SHTestCaseBlock)theBlock
                           withTimeout:(NSTimeInterval)theTimeout;

@end

```

Usage
-----

```objective-c

-(void)testSH_waitForTimeInterval; {
  __block BOOL assertion = NO;
  
  double delayInSeconds = 5.0;
  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
  dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
    assertion = YES;
  });
  
  [self SH_waitForTimeInterval:delayInSeconds];
  XCTAssertTrue(assertion);
}

-(void)testSH_runLoopUntilTestPassesWithBlock_withTimeOut; {
  NSString * keyPath   = @"sampleSet";
  __block BOOL didPass = NO;
  
  [self SH_addObserverForKeyPaths:@[keyPath] withOptions:0 block:^(id weakSelf, NSString *keyPath, NSDictionary *change) {
    didPass = YES;
  }];
  
  double delayInSeconds = 2;
  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
  dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
    [[self mutableArrayValueForKey:keyPath] addObject:@"Lol"];
  });
  
  
  [self SH_runLoopUntilTestPassesWithBlock:^BOOL{
    return didPass;
  } withTimeOut:5];
  
  
  XCTAssertTrue(didPass);
  
}

-(void)testSH_performAsyncTestsWithinBlock_withTimeout; {
  NSString * keyPath   = @"sampleArray";
  __block BOOL didPass = NO;
  
  [self SH_performAsyncTestsWithinBlock:^(BOOL *didFinish) {
    
    [self SH_addObserverForKeyPaths:@[keyPath] withOptions:0 block:^(id weakSelf, NSString *keyPath, NSDictionary *change) {
      didPass    = YES;
      *didFinish = YES;
    }];
    
    double delayInSeconds = 2;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
      [[self mutableArrayValueForKey:keyPath] addObject:@"Lol"];
    });
    
  } withTimeout:5];
  
  XCTAssertTrue(didPass);
  
  
  
}


```




Contact
-------

If you end up using SHTestCaseAdditions in a project, I'd love to hear about it.

email: [seivan.heidari@icloud.com](mailto:seivan.heidari@icloud.com)  
twitter: [@seivanheidari](https://twitter.com/seivanheidari)

## License

SHTestCaseAdditions is © 2013 [Seivan](http://www.github.com/seivan) and may be freely
distributed under the [MIT license](http://opensource.org/licenses/MIT).
See the [`LICENSE.md`](https://github.com/PodFactory/SHTestCaseAdditions/blob/master/LICENSE.md) file.

