
#import "SHPresenterBlocks.h"
#include "__SHPresentingViewController.private"
#include "__SHPresenterManager.private"



@interface SHPresenterBlocks (Private)
-(void)presentNextInQueue;
@end

@interface __SHPresentingViewController : UIViewController
@property(nonatomic,strong) UIWindow         * window;
@property(nonatomic,assign) UIWindowLevel  windowLevel;
@property(nonatomic,strong) UIViewController * queuedViewController;

@property(nonatomic,weak)  SHPresenterBlocks * presenter;

@property(nonatomic,assign,getter = isQueued)           BOOL queued;
@property(nonatomic,assign,getter = isAnimated)         BOOL animated;


@property(nonatomic,copy) SHPresenterCompletionBlock completionBlock;


-(instancetype)initWiewController:(UIViewController *)theViewController
                        presenter:(SHPresenterBlocks *)thePresenter
                      windowLevel:(UIWindowLevel)theWindowLevel
                         animated:(BOOL)theAnimatedFlag
                           queued:(BOOL)theQueuedFlag
                       completion:(SHPresenterCompletionBlock)theCompletion;


-(void)makeWindowKeyAndVisibleWithController;
@end

@implementation __SHPresentingViewController

-(instancetype)initWiewController:(UIViewController *)theViewController
                        presenter:(SHPresenterBlocks *)thePresenter
                           windowLevel:(UIWindowLevel)theWindowLevel
                         animated:(BOOL)theAnimatedFlag
                           queued:(BOOL)theQueuedFlag
                       completion:(SHPresenterCompletionBlock)theCompletion; {
  self = [super init];
  if(self) {
    NSParameterAssert(theViewController);
    NSParameterAssert(thePresenter);

    self.presenter            = thePresenter;
    self.queuedViewController = theViewController;
    self.windowLevel          = theWindowLevel;
    self.animated             = theAnimatedFlag;
    self.queued               = theQueuedFlag;
    self.completionBlock      = theCompletion;
  }
  
  return self;
}

-(void)viewWillAppear:(BOOL)animated; {
  [super viewWillAppear:animated];
  self.view.backgroundColor = [UIColor clearColor];
  self.view.frame = self.presenter.frame;
}

-(void)viewDidAppear:(BOOL)animated; {
  [super viewDidAppear:animated];
  
  if(self.queuedViewController) {
    //    __weak typeof(self.queuedViewController) weakQueuedViewController = self.queuedViewController;
    __weak typeof(self) weakSelf = self;
    void (^completionBlock)(void) = ^void(void) {
      if(weakSelf.completionBlock) weakSelf.completionBlock(weakSelf.queuedViewController);
      weakSelf.queuedViewController = nil;
    };
    
    [self presentViewController:self.queuedViewController
                       animated:self.isAnimated
                     completion:completionBlock];
    
  }
  
}


#pragma mark - Auto Rotation
-(BOOL)shouldAutorotate; {
  return [self.presentedViewController shouldAutorotate];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation; {
  return [self.presentedViewController shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
}

-(NSUInteger)supportedInterfaceOrientations; {
  return [self.presentedViewController supportedInterfaceOrientations];
}


#pragma mark - Show/Hide Overlay

-(void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion; {
  __weak typeof(self) weakSelf = self;
  [super dismissViewControllerAnimated:flag completion:^{
    
    NSArray  * windows   = [UIApplication sharedApplication].windows;
    UIWindow * keyWindow = [UIApplication sharedApplication].keyWindow;
    NSInteger lastIndex = [windows indexOfObject:windows.lastObject];
    
    __block NSInteger index = lastIndex;
    
    if (weakSelf.window == keyWindow) {
      [windows enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(UIWindow * window, NSUInteger idx, BOOL *stop) {
        if(weakSelf == window.rootViewController)
          *stop = YES;
        else
          index = idx;
      }];
      
      if(index == lastIndex)
        keyWindow = [windows objectAtIndex:lastIndex - 1];
      else
        keyWindow = [windows objectAtIndex:lastIndex];
    }
    
    weakSelf.window.windowLevel = UIWindowLevelNormal;
    weakSelf.window.rootViewController = nil;
    [keyWindow makeKeyAndVisible];
    if (weakSelf.isQueued) [weakSelf.presenter presentNextInQueue];
    if (completion) completion();
    
  }];
}

-(void)makeWindowKeyAndVisibleWithController; {
  UIWindow * window = [[UIWindow alloc] initWithFrame:self.presenter.frame];
  window.backgroundColor = [UIColor clearColor];
  window.rootViewController = self;
  window.windowLevel = self.windowLevel;
  self.window = window;
  [window makeKeyAndVisible];
}


@end

@interface SHPresenterBlocks ()
@property(nonatomic,strong) NSMutableOrderedSet * queue;
@property(nonatomic,copy)       NSString * name;

-(__SHPresentingViewController *)prepareViewController:(UIViewController *)theViewController
                                           windowLevel:(UIWindowLevel)theWindowLevel
                                              animated:(BOOL)theAnimatedFlag
                                                queued:(BOOL)theQueuedFlag
                                            completion:(SHPresenterCompletionBlock)theCompletion;
@end

@implementation SHPresenterBlocks

+(instancetype)presenter; {return [self presenterWithName:@"com.shpresenterblocks.default"]; }

+(instancetype)presenterWithName:(NSString *)theName; {
  NSParameterAssert(theName);
  SHPresenterBlocks  * presenter = [[__SHPresenterManager sharedManager].mapBlocks objectForKey:theName];
  if(presenter == nil) {
    presenter = [[[self class] alloc] init];
    presenter.name = theName;
    presenter.frame = [[UIScreen mainScreen] bounds];
    [[__SHPresenterManager sharedManager].mapBlocks setObject:presenter forKey:presenter.name];
  }
  return presenter;
}

-(void)presentViewController:(UIViewController *)theViewController
                 windowLevel:(UIWindowLevel)theWindowLevel
                    animated:(BOOL)theAnimatedFlag
                  completion:(SHPresenterCompletionBlock)theCompletion; {

  
  [[self prepareViewController:theViewController
                   windowLevel:theWindowLevel
                      animated:theAnimatedFlag
                        queued:NO
                    completion:theCompletion]
   makeWindowKeyAndVisibleWithController];

  
}


-(void)enqueueViewController:(UIViewController *)theViewController
                 windowLevel:(UIWindowLevel)theWindowLevel
                    animated:(BOOL)theAnimatedFlag
                  completion:(SHPresenterCompletionBlock)theCompletion;{
  __SHPresentingViewController * controller = [self prepareViewController:theViewController windowLevel:theWindowLevel animated:theAnimatedFlag queued:YES completion:theCompletion];
  
  if(self.queuedCount == 0)
    [controller makeWindowKeyAndVisibleWithController];
  [self.queue addObject:controller];
  
}





-(void)dismissViewController:(UIViewController *)theViewController
                    animated:(BOOL)theAnimatedFlag
                  completion:(SHPresenterCompletionBlock)theCompletion; {
  NSParameterAssert([theViewController.presentingViewController
                     isKindOfClass:[__SHPresentingViewController class]]);
  [theViewController.presentingViewController dismissViewControllerAnimated:theAnimatedFlag completion:^{
    if(theCompletion) theCompletion(theViewController);
  }];
  
  
}


-(UIViewController *)topViewController; {
  __block UIViewController * topViewController = nil;
  

  [[UIApplication sharedApplication].windows enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(UIWindow * obj, __unused NSUInteger idx, BOOL *stop) {
    if([obj.rootViewController isKindOfClass:[__SHPresentingViewController class]]) {
      UIViewController * controller = obj.rootViewController.presentedViewController;
      topViewController = controller;
      *stop = YES;
    }
  }];
  
  return topViewController;

}

-(void)dismissAllViewControllersAnimated:(BOOL)theAnimatedFlag
                              completion:(SHPresenterCompletionBlock)theCompletion; {
  self.queue = nil;
  dispatch_group_t signalAllDismissedComplete = dispatch_group_create();
  [[UIApplication sharedApplication].windows enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(UIWindow * obj, __unused NSUInteger idx, BOOL *stop) {
    if([obj.rootViewController isKindOfClass:[__SHPresentingViewController class]]) {
      dispatch_group_enter(signalAllDismissedComplete);
      [obj.rootViewController dismissViewControllerAnimated:theAnimatedFlag completion:^{
        dispatch_group_leave(signalAllDismissedComplete);
      }];
    }
  }];

  dispatch_group_notify(signalAllDismissedComplete, dispatch_get_main_queue(), ^{
    if(theCompletion) theCompletion(nil);
  });
}


#pragma mark - Properties
-(NSMutableOrderedSet *)queue; {
  if(_queue == nil) _queue = [NSMutableOrderedSet orderedSet];
  return _queue;
}
-(NSInteger)queuedCount; {
  return self.queue.count;
}

#pragma mark - Privates
-(void)presentNextInQueue; {
  if (self.queuedCount > 0) [self.queue removeObjectAtIndex:0];
  __SHPresentingViewController * queuedController = self.queue.firstObject;
  [queuedController makeWindowKeyAndVisibleWithController];


}

-(__SHPresentingViewController *)prepareViewController:(UIViewController *)theViewController
                                           windowLevel:(UIWindowLevel)theWindowLevel
                                              animated:(BOOL)theAnimatedFlag
                                                queued:(BOOL)theQueuedFlag
                                            completion:(SHPresenterCompletionBlock)theCompletion; {
  


  return [[__SHPresentingViewController alloc]
          initWiewController:theViewController
          presenter:self
          windowLevel:theWindowLevel
          animated:theAnimatedFlag
          queued:theQueuedFlag
          completion:theCompletion];

  
  
}
@end
