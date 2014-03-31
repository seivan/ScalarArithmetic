

#import "UIViewController+SHTransitionBlocks.h"


#define SHStaticConstString(X) static NSString * const X = @#X

SHStaticConstString(SH_AnimatedTransition);

@interface SHAnimatedTransition : NSObject
<SHViewControllerAnimatedTransitioning>

@property(nonatomic,weak) UIViewController                       * controller;

@property(nonatomic,strong) UIPercentDrivenInteractiveTransition * percentDrivenInteractiveTransition;
@property(nonatomic,strong) UIGestureRecognizer                  * gestureRecognizer;


@property(nonatomic,copy) SHTransitionCallbackGestureRecognizerBlock     blockOnGestureCallbackBlock;
@property(nonatomic,copy) SHTransitionPreparedAnimationBlock blockAnimationDurationWithPreparedTransition;
@property(nonatomic,copy) SHTransitionAnimationBlock         blockAnimatedTransition;
@property(nonatomic,copy) SHTransitionDurationBlock          blockDurationTransition;

-(void)handleGestureRecognizer:(UIGestureRecognizer *)theGestureRecognizer;

@end

@implementation SHAnimatedTransition
@synthesize reversed = _reversed;
@synthesize userInfo = _userInfo;
@synthesize transitionContext = _transitionContext;

-(instancetype)init; {
  self = [super init];
  if(self) {
    self.userInfo = @{}.mutableCopy;
  }
  return self;
}

#pragma mark - <UIViewControllerAnimatedTransitioning>
-(NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext; {
  NSParameterAssert(self.blockDurationTransition);
  _transitionContext = transitionContext;
  return self.blockDurationTransition(self);
}

-(void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext; {
  _transitionContext = transitionContext;
  if(self.blockAnimatedTransition) {
    self.blockAnimatedTransition(self);
  }
  else if(self.blockAnimationDurationWithPreparedTransition) {
    UIViewController * fromVC         = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController * toVC           = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView           * containerView  = [transitionContext containerView];
    NSTimeInterval transitionDuration = [self transitionDuration:transitionContext];
    
    [containerView addSubview:fromVC.view];
    [containerView addSubview:toVC.view];
    

    SHTransitionAnimationCompletionBlock completionBlock = ^() {
      [transitionContext completeTransition:![transitionContext transitionWasCancelled]];

    };
    self.blockAnimationDurationWithPreparedTransition(containerView, fromVC, toVC, transitionDuration, self, completionBlock);
    
  }
  
  
}

-(void)handleGestureRecognizer:(UIGestureRecognizer *)theGestureRecognizer; {
  if(self.blockOnGestureCallbackBlock){
    CGPoint location = [theGestureRecognizer locationInView:theGestureRecognizer.view];
    self.blockOnGestureCallbackBlock(self.controller, theGestureRecognizer, theGestureRecognizer.state, location);
  }
  
}


@end


@interface SHAnimatedTransitionManager : NSObject

@property(nonatomic,strong)   NSMapTable   * mapBlocks;


+(instancetype)sharedManager;
-(void)SH_memoryDebugger;


#pragma mark - Class selectors

+(void)setValue:(id)theValue
  forController:(UIViewController *)theController
        withKey:(NSString *)theKey;



#pragma mark - Getter
+(id)valueForController:(UIViewController *)theController withKey:(NSString *)theKey;

@end


@implementation SHAnimatedTransitionManager


#pragma mark - Init & Dealloc
-(instancetype)init; {
  self = [super init];
  if (self) {
    self.mapBlocks            = [NSMapTable weakToStrongObjectsMapTable];
    //    [self SH_memoryDebugger];
  }
  
  return self;
}

+(instancetype)sharedManager; {
  static SHAnimatedTransitionManager * _sharedInstance;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _sharedInstance = [[SHAnimatedTransitionManager alloc] init];
    
  });
  
  return _sharedInstance;
  
}



#pragma mark - Debugger
-(void)SH_memoryDebugger; {
  double delayInSeconds = 2.0;
  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
  dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
    NSLog(@"MAP %@",self.mapBlocks);
    [self SH_memoryDebugger];
  });
}


#pragma mark - Class selectors


#pragma mark - Setter

+(void)setValue:(id)theValue
  forController:(UIViewController *)theController
        withKey:(NSString *)theKey; {
  
  NSParameterAssert(theController);
  NSParameterAssert(theKey);
  
  id value = theValue;
  
  SHAnimatedTransitionManager * manager = [SHAnimatedTransitionManager sharedManager];
  NSMutableDictionary * map = [manager.mapBlocks objectForKey:theController];
  if(map == nil) {
    map = [@{} mutableCopy];
    [manager.mapBlocks setObject:map forKey:theController];
  }
  
  if(value == nil) {
    [map removeObjectForKey:theKey];
    if(map.count == 0) [manager.mapBlocks removeObjectForKey:theController];
  }
  
  else map[theKey] = value;
  
}


#pragma mark - Getter
+(id)valueForController:(UIViewController *)theController withKey:(NSString *)theKey; {
  NSParameterAssert(theController);
  NSParameterAssert(theKey);
  return [[[SHAnimatedTransitionManager sharedManager].mapBlocks
           objectForKey:theController] objectForKey:theKey];
}




@end

@interface UIViewController ()
@property(nonatomic,strong, setter = SH_setTransition:) SHAnimatedTransition * SH_transition;
@end

@implementation UIViewController (SHTransitionBlocks)

-(void)SH_setInteractiveTransition:(UIPercentDrivenInteractiveTransition *)SH_interactiveTransition; {
  self.SH_transition.percentDrivenInteractiveTransition = SH_interactiveTransition;
}

-(UIPercentDrivenInteractiveTransition *)SH_interactiveTransition; {
  return self.SH_transition.percentDrivenInteractiveTransition;
}

-(void)SH_setInteractiveTransitionWithGestureBlock:(SHTransitionGestureRecognizerCreationBlock)theGestureCreateBlock
                            onGestureCallbackBlock:(SHTransitionCallbackGestureRecognizerBlock)theGestureCallbackBlock; {

  
  if(theGestureCreateBlock == nil) {
    [self.SH_transition.gestureRecognizer removeTarget:self.SH_transition action:@selector(handleGestureRecognizer:)];
    [self.SH_transition.gestureRecognizer.view removeGestureRecognizer:self.SH_transition.gestureRecognizer];
    self.SH_transition.gestureRecognizer = nil;
    self.SH_transition.blockOnGestureCallbackBlock = nil;
    self.SH_transition.percentDrivenInteractiveTransition = nil;
    self.SH_transition.controller = nil;
  }
  else {
    UIScreenEdgePanGestureRecognizer * gesture =[[UIScreenEdgePanGestureRecognizer alloc]
                                               initWithTarget:nil
                                               action:nil];
  
    gesture = (UIScreenEdgePanGestureRecognizer *)theGestureCreateBlock(gesture);
    NSParameterAssert(gesture);
    self.SH_transition.percentDrivenInteractiveTransition = nil;
    self.SH_transition.gestureRecognizer = gesture;
    self.SH_transition.blockOnGestureCallbackBlock = theGestureCallbackBlock;
    self.SH_transition.controller = self;
    [gesture addTarget:self.SH_transition action:@selector(handleGestureRecognizer:)];
    [self.view addGestureRecognizer:gesture];
  }
  
  
}

-(id<SHViewControllerAnimatedTransitioning>)SH_animatedTransition {
    NSParameterAssert(self.SH_blockDurationTransition);

  if(self.SH_blockAnimatedTransition == nil )
    NSParameterAssert(self.SH_blockAnimationDurationWithPreparedTransition);
  else
    NSParameterAssert(self.self.SH_blockAnimatedTransition);
  
  id<SHViewControllerAnimatedTransitioning> transition = self.SH_transition;
  
  return transition;
}

-(void)SH_setAnimationDuration:(NSTimeInterval)theDuration
   withPreparedTransitionBlock:(SHTransitionPreparedAnimationBlock)theBlock; {
  [self SH_setDurationTransitionBlock:^NSTimeInterval(id<SHViewControllerAnimatedTransitioning> transitionObject) {
    return theDuration;
  }];
  self.SH_transition.blockAnimationDurationWithPreparedTransition = theBlock;
}
-(void)SH_setAnimatedTransitionBlock:(SHTransitionAnimationBlock)theBlock; {
  self.SH_transition.blockAnimatedTransition = theBlock;
}

-(void)SH_setDurationTransitionBlock:(SHTransitionDurationBlock)theBlock; {
  self.SH_transition.blockDurationTransition = theBlock;
}

-(SHTransitionPreparedAnimationBlock)SH_blockAnimationDurationWithPreparedTransition; {
  return self.SH_transition.blockAnimationDurationWithPreparedTransition;
}

-(SHTransitionAnimationBlock)SH_blockAnimatedTransition; {
  return self.SH_transition.blockAnimatedTransition;
}

-(SHTransitionDurationBlock)SH_blockDurationTransition; {
  return self.SH_transition.blockDurationTransition;
}

#pragma mark - Private
-(void)SH_setTransition:(SHAnimatedTransition *)theTransition; {
  [SHAnimatedTransitionManager setValue:theTransition forController:self withKey:SH_AnimatedTransition];
}

-(SHAnimatedTransition *)SH_transition; {
  id<SHViewControllerAnimatedTransitioning> transition = [SHAnimatedTransitionManager
                                                          valueForController:self
                                                          withKey:SH_AnimatedTransition];
  if(transition == nil) {
    transition = [[SHAnimatedTransition alloc] init];
    self.SH_transition = transition;
  }

  return transition;
}

@end