
#import "XCTestCase+SHTestCaseAdditions.h"
#import "__SHTestCaseInternal.h"

@implementation XCTestCase (SHTestCaseAdditions)

-(void)SH_waitForTimeInterval:(NSTimeInterval)theTimeInterval; {
  XCTAssertTrue([__SHTestCaseInternal waitForTimeInterval:theTimeInterval], @"%@", [__SHTestCaseInternal timeOutMessage]);
}

-(void)SH_runLoopUntilTestPassesWithBlock:(SHTestCaseConditional)theBlock withTimeOut:(NSTimeInterval)theTimeout; {
  XCTAssertTrue([__SHTestCaseInternal runLoopUntilTestPassesWithBlock:theBlock withTimeOut:theTimeout], @"%@",[__SHTestCaseInternal timeOutMessage]) ;
}

-(void)SH_performAsyncTestsWithinBlock:(SHTestCaseBlock)theBlock withTimeout:(NSTimeInterval)theTimeout; {
  XCTAssertTrue([__SHTestCaseInternal performAsyncTestsWithinBlock:theBlock withTimeout:theTimeout], @"%@",[__SHTestCaseInternal timeOutMessage]) ;  
}


@end
