
typedef void (^SHPresenterCompletionBlock)(UIViewController * controller);

@interface SHPresenterBlocks : NSObject
//<UIDynamicItem>
@property(nonatomic,copy,readonly) NSString * name;
@property(nonatomic,readonly)      NSInteger  queuedCount;
@property(nonatomic,assign)        CGRect     frame;

@property(nonatomic,readonly) UIViewController * topViewController;

-(id)init __attribute__((unavailable("Use presenterWithName:")));
+(instancetype)presenterWithName:(NSString *)theName;
+(instancetype)presenter;

-(void)presentViewController:(UIViewController *)theViewController
                 windowLevel:(UIWindowLevel)theWindowLevel
                    animated:(BOOL)theAnimatedFlag
                  completion:(SHPresenterCompletionBlock)theCompletion;


-(void)enqueueViewController:(UIViewController *)theViewController
                 windowLevel:(UIWindowLevel)theWindowLevel
                    animated:(BOOL)theAnimatedFlag
                  completion:(SHPresenterCompletionBlock)theCompletion;


-(void)dismissViewController:(UIViewController *)theViewController
                    animated:(BOOL)theAnimatedFlag
                  completion:(SHPresenterCompletionBlock)theCompletion;


-(void)dismissAllViewControllersAnimated:(BOOL)theAnimatedFlag
                              completion:(SHPresenterCompletionBlock)theCompletion;

//+(void)dismissAllViewControllersAnimated:(BOOL)theAnimatedFlag
//                              completion:(SHPresenterCompletionBlock)theCompletion;


@end
