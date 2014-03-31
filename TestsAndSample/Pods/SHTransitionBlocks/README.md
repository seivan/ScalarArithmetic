#SHTransitionBlocks

[![Build Status](https://travis-ci.org/seivan/SHTransitionBlocks.png?branch=master)](https://travis-ci.org/seivan/SHTransitionBlocks)
[![Version](https://cocoapod-badges.herokuapp.com/v/SHTransitionBlocks/badge.png)](http://cocoadocs.org/docsets/SHTransitionBlocks)
[![Platform](https://cocoapod-badges.herokuapp.com/p/SHTransitionBlocks/badge.png)](http://cocoadocs.org/docsets/SHTransitionBlocks)

> This pod is used by [`SHUIKitBlocks`](https://github.com/seivan/SHUIKitBlocks) as part of many components covering to plug the holes missing from Foundation, UIKit, CoreLocation, GameKit, MapKit and other aspects of an iOS application's architecture.

***

###Overview

Transition API via blocks for AnimationTransition and InteractiveTransitions.
InteractiveTransitions comes with block helpers for dealing with gestures and progress.
All via categorizes on top of UIViewController, so it works well with UINavigationController and UITabBarController

***

### Installation

```ruby
pod 'SHTransitionBlocks' 
```

***

### Setup

Put this either in specific files or your project prefix file

```objective-c
#import "UIViewController+SHTransitionBlocks.h"
```
or
```objective-c
#import "SHTransitionBlocks.h"
```

***

### Usage with [SHNavigationControllerBlocks](https://github.com/Seivan/SHNavigationControllerBlocks)

> So we're going to add a pan gesture to the left edge of the navigationControllers view for popping the stack.
This makes it so any pushed controllers on a navigationController can pop itself with a left edge pan gesture. 
Nothing fancy in the animation itself. 

You can always check the [Sample](https://github.com/seivan/SHTransitionBlocks/blob/develop/TestsAndSample/Sample/SHViewController.m)
Just download the zip and build & run. 


```objective-c
 -(void)viewDidLoad; {
  [super viewDidLoad];
```

>So can add the blocks on the first view controller on the UINavigationController stack, ```viewDidLoad``` will have to do here, but you can always extract it out easy (just take the entire block!)

```objective-c
  [self.navigationController SH_setAnimationDuration:0.5 withPreparedTransitionBlock:^(UIView *containerView, UIViewController *fromVC, UIViewController *toVC, NSTimeInterval duration, id<SHViewControllerAnimatedTransitioning> transitionObject, SHViewControllerAnimationCompletionBlock transitionDidComplete) {
```

> A lot of callback variables, lets break it down.

  * containerView, the container containing both fromVC.view and toVC.view
  * fromVC, the controller pushing, eg the first view controller on the navigation stack
  * toVC, the controller being pushed on the stack. 
  * duration, of animation, as of now it's 0.5. Can also be set on a per context basis. 
  * transitionObject, containing the context and reverse flag.
  * transitionDidComplete block, the block to call once the animation is over. 

```objective-c
    if (transitionObject.isReversed == NO) {
      toVC.view.layer.affineTransform = CGAffineTransformMakeTranslation(CGRectGetWidth(toVC.view.frame), 0);
    }
    else {
      toVC.view.layer.affineTransform = CGAffineTransformMakeTranslation(-CGRectGetWidth(toVC.view.frame), 0);
    }
```

> Notice we use the ```transitionObject``` to access ```isReversed``` flag to check for pop or push

```objective-c
    [UIView animateWithDuration:duration delay:0 options:kNilOptions  animations:^{
      toVC.view.layer.affineTransform = CGAffineTransformIdentity;
      
      if(transitionObject.isReversed) {
        CGAffineTransform t = CGAffineTransformIdentity;
        t = CGAffineTransformMakeTranslation(CGRectGetWidth(fromVC.view.frame), 0);
        //      fromView.layer.affineTransform = CGAffineTransformScale(t, 0.5, 0.5);
        fromVC.view.layer.affineTransform = t;
        
        
      }
      else {
        CGAffineTransform t = CGAffineTransformIdentity;
        t = CGAffineTransformMakeTranslation(-CGRectGetWidth(fromVC.view.frame), 0);
        fromVC.view.layer.affineTransform = t;
        
      }
```
> Nothing complicated, a normal animation. Notice we use the duration variable for UIView Animation.

      
```objective-c
    } completion:^(BOOL finished) {
      toVC.view.layer.affineTransform = CGAffineTransformIdentity;
      fromVC.view.layer.affineTransform = CGAffineTransformIdentity;
      transitionDidComplete();
    }];

  }];

```

> Notice how we call transitionDidComplete(); to clean up after the block. 
  
```objective-c
  [self.navigationController SH_setInteractiveTransitionWithGestureBlock:^UIGestureRecognizer *(
  UIScreenEdgePanGestureRecognizer *edgeRecognizer) {
    edgeRecognizer.edges = UIRectEdgeLeft;
    return edgeRecognizer;
```

  > We can either use the UIScreenEdgePanGestureRecognizer that is following the block or create our own and return it. Any subclass of UIGestureRecognizer will do. 
  In our case now, we set it for UIRectEdgeLeft pans since, we're poppin'. :-) 
 
```objective-c
  } onGestureCallbackBlock:^void(UIViewController * controller, UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
    UIScreenEdgePanGestureRecognizer * recognizer = (UIScreenEdgePanGestureRecognizer*)sender;
    CGFloat progress = [recognizer translationInView:sender.view].x / (recognizer.view.bounds.size.width * 1.0);
    progress = MIN(1.0, MAX(0.0, progress));
    
    if (state == UIGestureRecognizerStateBegan) {
      // Create a interactive transition and pop the view controller
      controller.SH_interactiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
      [(UINavigationController *)controller popViewControllerAnimated:YES];
    }
    else if (state == UIGestureRecognizerStateChanged) {
      // Update the interactive transition's progress
      [controller.SH_interactiveTransition updateInteractiveTransition:progress];
    }
    else if (state == UIGestureRecognizerStateEnded || state == UIGestureRecognizerStateCancelled) {
      // Finish or cancel the interactive transition
      if (progress > 0.5) {
        [controller.SH_interactiveTransition finishInteractiveTransition];
      }
      else {
        [controller.SH_interactiveTransition cancelInteractiveTransition];
      }
      
      controller.SH_interactiveTransition = nil;
    }
  
  }];
```

  > A tad more complicated, but to break it down, once the pan start, 
  we set the ```controller``` (in our case, the navigationController) 
  ```SH_interactiveTransition``` to the ```UIPercentDrivenInteractiveTransition```. 
  We only do this once a pop is about to happen, never anytime else as we want the 
  ```SH_interactiveTransition``` to be nil if we're popping without a gesture updating it. 
  Notice how we set it to nil once the gesture ended. 



```objective-c
  [self.navigationController SH_setAnimatedControllerBlock:^id<UIViewControllerAnimatedTransitioning>(UINavigationController *navigationController, UINavigationControllerOperation operation, UIViewController *fromVC, UIViewController *toVC) {
    navigationController.SH_animatedTransition.reversed = operation == UINavigationControllerOperationPop;
    return navigationController.SH_animatedTransition;
  }];
```

  > We're using [SHNavigationControllerBlocks](https://github.com/Seivan/) here to power our animation transition here in a block instead of a delegate callback. Easier to extract out as well once you've prototyped. Blocks are easier to prototype with. 


```objective-c
  [self.navigationController SH_setInteractiveControllerBlock:^id<UIViewControllerInteractiveTransitioning>(UINavigationController *navigationController, id<UIViewControllerAnimatedTransitioning> animationController) {
    return navigationController.SH_interactiveTransition;
  }];
}
```

  > If we currently have no gesture being processed ```navigationController.SH_interactiveTransition``` will be nil, and a normal pop will occur.
  However if we do have a gesture being processed ```navigationController.SH_interactiveTransition``` will not be nil, and being passed as an interactionController for processing as our gesture progress. 




***

### API

```objective-c

@protocol SHViewControllerAnimatedTransitioning <UIViewControllerAnimatedTransitioning>
@property(nonatomic,assign,getter = isReversed) BOOL reversed;
@property(nonatomic,strong) NSMutableDictionary * userInfo;
@property(nonatomic,readonly) id<UIViewControllerContextTransitioning> transitionContext;
@end

typedef void(^SHTransitionAnimationCompletionBlock)();

typedef void(^SHTransitionPreparedAnimationBlock)(UIView * containerView,
                                                                   UIViewController * fromVC,
                                                                   UIViewController * toVC,
                                                                   NSTimeInterval duration,
                                                                   id<SHViewControllerAnimatedTransitioning> transitionObject,
                                                                   SHTransitionAnimationCompletionBlock transitionDidComplete
                                                                          );

typedef void(^SHTransitionAnimationBlock)(id<SHViewControllerAnimatedTransitioning> transitionObject);

typedef NSTimeInterval(^SHTransitionDurationBlock)(id<SHViewControllerAnimatedTransitioning> transitionObject);

typedef UIGestureRecognizer *(^SHTransitionGestureRecognizerCreationBlock)(UIScreenEdgePanGestureRecognizer * edgeRecognizer);

typedef void(^SHTransitionCallbackGestureRecognizerBlock)(UIViewController * controller,
                                                          UIGestureRecognizer * recognizer,
                                                          UIGestureRecognizerState state,
                                                          CGPoint location
                                                          );


@interface UIViewController (SHTransitionBlocks)

@property(nonatomic,strong, setter = SH_setInteractiveTransition:) UIPercentDrivenInteractiveTransition * SH_interactiveTransition;

-(void)SH_setInteractiveTransitionWithGestureBlock:(SHTransitionGestureRecognizerCreationBlock)theGestureCreateBlock
                            onGestureCallbackBlock:(SHTransitionCallbackGestureRecognizerBlock)theGestureCallbackBlock;

-(id<SHViewControllerAnimatedTransitioning>)SH_animatedTransition;

-(void)SH_setAnimationDuration:(NSTimeInterval)theDuration
   withPreparedTransitionBlock:(SHTransitionPreparedAnimationBlock)theBlock;

-(void)SH_setAnimatedTransitionBlock:(SHTransitionAnimationBlock)theBlock;
-(void)SH_setDurationTransitionBlock:(SHTransitionDurationBlock)theBlock;

@property(nonatomic,readonly) SHTransitionPreparedAnimationBlock SH_blockAnimationDurationWithPreparedTransition;
@property(nonatomic,readonly)  SHTransitionAnimationBlock SH_blockAnimatedTransition;
@property(nonatomic,readonly)  SHTransitionDurationBlock SH_blockDurationTransition;


@end
```

***

###Contact


If you end up using SHTransitionBlocks in a project, I'd love to hear about it.

email: [seivan.heidari@icloud.com](mailto:seivan.heidari@icloud.com)  
twitter: [@seivanheidari](https://twitter.com/seivanheidari)

***

### License

SHTransitionBlocks is © 2013 [Seivan](http://www.github.com/seivan) and may be freely
distributed under the [MIT license](http://opensource.org/licenses/MIT).
See the [`LICENSE.md`](https://github.com/seivan/SHTransitionBlocks/blob/master/LICENSE.md) file.

*** 