



#pragma mark -
#pragma mark Block Definitions
typedef BOOL (^SHTestCaseConditional)();
typedef void (^SHTestCaseBlock)(BOOL *didFinish);

@protocol SHTesting <NSObject>
#pragma mark -
#pragma mark Helpers
-(void)SH_waitForTimeInterval:(NSTimeInterval)theTimeInterval;


-(void)SH_runLoopUntilTestPassesWithBlock:(SHTestCaseConditional)theBlock
                              withTimeOut:(NSTimeInterval)theTimeout;

-(void)SH_performAsyncTestsWithinBlock:(SHTestCaseBlock)theBlock
                           withTimeout:(NSTimeInterval)theTimeout;
@end