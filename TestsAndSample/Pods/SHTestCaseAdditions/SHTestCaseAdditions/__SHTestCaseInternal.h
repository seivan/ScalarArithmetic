

@interface __SHTestCaseInternal : NSObject

#pragma mark -
#pragma mark Block Definitions
typedef BOOL (^__SHTestCaseInternalTestCaseConditional)();
typedef void (^__SHTestCaseInternalTestCaseBlock)(BOOL *didFinish);

+(NSString *)timeOutMessage;

#pragma mark -
#pragma mark Helpers
+(BOOL)waitForTimeInterval:(NSTimeInterval)theTimeInterval;


+(BOOL)runLoopUntilTestPassesWithBlock:(__SHTestCaseInternalTestCaseConditional)theBlock
                              withTimeOut:(NSTimeInterval)theTimeout;

+(BOOL)performAsyncTestsWithinBlock:(__SHTestCaseInternalTestCaseBlock)theBlock
                           withTimeout:(NSTimeInterval)theTimeout;

@end


