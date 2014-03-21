
#import "__SHTestCaseInternal.h"

@implementation __SHTestCaseInternal

+(NSString *)timeOutMessage; {
  return @"Timed Out";
}

+(BOOL)waitForTimeInterval:(NSTimeInterval)theTimeInterval; {
  NSParameterAssert(theTimeInterval > 0.0);
  return [self performAsyncTestsWithinBlock:^(BOOL *didFinish) {
    double delayInSeconds = theTimeInterval;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
      *didFinish = YES;
    });
  } withTimeout:theTimeInterval+5];

}

+(BOOL)runLoopUntilTestPassesWithBlock:(__SHTestCaseInternalTestCaseConditional)theBlock withTimeOut:(NSTimeInterval)theTimeout; {
  NSParameterAssert(theBlock);
  NSParameterAssert(theTimeout >= 0);
  NSDate * timeoutDate = [NSDate dateWithTimeIntervalSinceNow:theTimeout];
  
  NSTimeInterval timeoutTime = [timeoutDate timeIntervalSinceReferenceDate];
  NSTimeInterval currentTime = 0.0;
  
  
  for (currentTime = [NSDate timeIntervalSinceReferenceDate];
       (theBlock() == NO && currentTime < timeoutTime);
       currentTime = [NSDate timeIntervalSinceReferenceDate]) {
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
  }
  
  return currentTime <= timeoutTime;
}

+(BOOL)performAsyncTestsWithinBlock:(__SHTestCaseInternalTestCaseBlock)theBlock withTimeout:(NSTimeInterval)theTimeout; {
  NSParameterAssert(theBlock);
  NSParameterAssert(theTimeout >= 0);

  NSDate * timeoutDate = [NSDate dateWithTimeIntervalSinceNow:theTimeout];
  
  NSTimeInterval timeoutSeconds = [timeoutDate timeIntervalSinceReferenceDate];
  NSTimeInterval currentTime = 0.0;
  
  __block BOOL didFinish = NO;
  theBlock(&didFinish);
  for (currentTime = [NSDate timeIntervalSinceReferenceDate];
       (didFinish == NO && currentTime < timeoutSeconds);
       currentTime = [NSDate timeIntervalSinceReferenceDate]) {
    
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    
  }
  
  return currentTime <= timeoutSeconds;
}


@end
