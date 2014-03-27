//
//  SHViewController.m
//  Example
//
//  Created by Seivan Heidari on 5/14/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//




#import "SHViewController.h"
#import <SHPresenterBlocks.h>
#import "SHAlertViewController.h"
#import "SHStatusBarNotificationController.h"

@interface SHViewController ()
@property(nonatomic,strong) SHAlertViewController * vc;
@end

@implementation SHViewController

-(IBAction)unwinder:(UIStoryboardSegue *)sender; {
  
}

-(void)viewDidLoad; {
  [super viewDidLoad];
  
  [SHAlertViewController setLayoutWithPaddingType:SHAVCPaddingTopToNext padding:25];
  [SHAlertViewController setLayoutWithPaddingType:SHAVCPaddingButtonToNext padding:15];
  [SHAlertViewController setLayoutWithPaddingType:SHAVCPaddingBottomToPrevious padding:25];
  [SHAlertViewController styleAlertContentWithCompletionHandler:^id(NSInteger index, UILabel *lblContent) {
    id contentHolder = nil;
    if(index == 1) {
      UITextField * message = [[UITextField alloc] initWithFrame:CGRectZero];
      message.placeholder = @"asdasdasdasd";
      message.textAlignment = NSTextAlignmentCenter;
      contentHolder = message;
    }
    else {
      lblContent.textColor = [UIColor redColor];
      lblContent.font = [UIFont boldSystemFontOfSize:20.f];
      contentHolder = lblContent;
    }
    return contentHolder;

  }];

  [SHAlertViewController styleAlertButtonWithCompletionHandler:^UIControl *(NSInteger index, UIButton *button) {
    if(index == 0) button.tintColor = [UIColor blackColor];
    else  button.tintColor = [UIColor redColor];
    button.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:20.f];
    return button;
  }];

}
-(void)viewDidAppear:(BOOL)animated; {
  [super viewDidAppear:animated];

}

-(void)removeAlert:(UITapGestureRecognizer *)tap; {

  

}

-(IBAction)tapShowAlert:(id)sender; {

  for (NSInteger i = 0; i != 3; i++) {
    NSString * title = [NSString stringWithFormat:@"Title %@ of %@", @(i+1), @(3)];

    SHAlertViewController * vc = [SHAlertViewController alertWithTitle:title message:@"So this is the message" buttonTitles:@[@"Damn", @"LOL", @"last"] completion:^(NSInteger buttonIndex) {
      NSLog(@"init: %@", @(buttonIndex));
    }];
  
  vc.attributedTitle = [[NSAttributedString alloc] initWithString:vc.title attributes:@{NSTextEffectAttributeName : NSTextEffectLetterpressStyle}];
  
  vc.attributedMessage = [[NSAttributedString alloc] initWithString:vc.message attributes:@{NSTextEffectAttributeName : NSTextEffectLetterpressStyle}];

//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeAlert:)];

//    [vc.view addGestureRecognizer:tap];
//    [vc addButtonWithTitle:@"CANCEL" completion:^(NSInteger buttonIndex) {
//      NSLog(@"%@", @(buttonIndex));
//    }];
//    [vc addButtonWithTitle:@"OK" completion:^(NSInteger buttonIndex) {
//      NSLog(@"%@", @(buttonIndex));
//    }];
//    [vc addButtonWithTitle:@"WAT?" completion:^(NSInteger buttonIndex) {
//      NSLog(@"%@", @(buttonIndex));
//    }];

//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//      for (NSInteger i = 0; i != 5; i++) {
//        vc.title = [NSString stringWithFormat:@"%@ \n",vc.title];
//        vc.message = [NSString stringWithFormat:@"%@ \n",vc.title];
//      }
//      
//      [vc addButtonWithTitle:@"LAST BUTTON"];
//    });
    [vc show];
  }


//  SHPresenterBlocks * presenter = [SHPresenterBlocks presenter];
//  for (NSInteger i = 0 ; i != 5; i++) {
//    SHAlertViewController * vc = SHAlertViewController.new;
//    NSInteger aRedValue = arc4random()%255;
//    NSInteger aGreenValue = arc4random()%255;
//    NSInteger aBlueValue = arc4random()%255;
//    
//    UIColor *randColor = [UIColor colorWithRed:aRedValue/255.0f green:aGreenValue/255.0f blue:aBlueValue/255.0f alpha:1.0f];
//    vc.view.backgroundColor = randColor;
//
//    UILabel * lblFirst  = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 250, 50)];
//    lblFirst.text  = @"Tap to dismiss";
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeAlert:)];
////    [vc.view addSubview:lblFirst];
//    [vc.view addGestureRecognizer:tap];
//
//    if(i % 2 == 0 ) {
//    lblFirst.text = [NSString stringWithFormat:@"ALERT %@", @(i)];
//      [presenter presentViewController:vc windowLevel:UIWindowLevelAlert animated:YES completion:^(UIViewController *controller) {
//        NSLog(@"PRESENTED");
//      }];
//    }
//    else [presenter enqueueViewController:vc windowLevel:UIWindowLevelAlert animated:YES completion:^(UIViewController *controller) {
//      NSLog(@"COMPLETE %@", controller);
//    }];
//  }
//  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
////    [presenter dismissAllViewControllersAnimated:YES completion:nil];
//  });
  
  
}

//-(IBAction)tapShowStatusBarAlertBelow:(id)sender; {
//  SHPresenterBlocks * presenter = [SHPresenterBlocks presenterWithName:@"statusbarBelow"];
//  presenter.frame = CGRectMake(0, 0, 320, 22);
//  for (NSInteger i = 1; i != 3; i++) {
//    SHStatusBarNotificationController * vc = SHStatusBarNotificationController.new;
//    vc.alertTitle = nil;
//    NSInteger aRedValue = arc4random()%255;
//    NSInteger aGreenValue = arc4random()%255;
//    NSInteger aBlueValue = arc4random()%255;
//    
//    UIColor *randColor = [UIColor colorWithRed:aRedValue/255.0f green:aGreenValue/255.0f blue:aBlueValue/255.0f alpha:1.0f];
//    
//    vc.view.backgroundColor = randColor;
//    vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//    
//    [presenter enqueueViewController:vc windowLevel:UIWindowLevelNormal animated:YES completion:^(UIViewController *controller) {
//      NSLog(@"PRESENTED");
//      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [presenter dismissTopViewControllerAnimated:YES completion:nil];
//      });
//    }];
//  }
//
//}

//-(IBAction)tapShowStatusBarAlertAbove:(id)sender; {
//  SHPresenterBlocks * presenter = [SHPresenterBlocks presenterWithName:@"statusbarAbove"];
//  presenter.frame = CGRectMake(0, 0, 320, 22);
//  for (NSInteger i = 1; i != 3; i++) {
//    SHStatusBarNotificationController * vc = SHStatusBarNotificationController.new;
//    vc.alertTitle = [NSString stringWithFormat:@"Alert %@ of %@", @(i), @(3)];
//    vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//    NSInteger aRedValue = arc4random()%255;
//    NSInteger aGreenValue = arc4random()%255;
//    NSInteger aBlueValue = arc4random()%255;
//    
//    UIColor *randColor = [UIColor colorWithRed:aRedValue/255.0f green:aGreenValue/255.0f blue:aBlueValue/255.0f alpha:1.0f];
//    
//    vc.view.backgroundColor = randColor;
//    
//    [presenter enqueueViewController:vc windowLevel:UIWindowLevelAlert animated:YES completion:^(UIViewController *controller) {
//      NSLog(@"PRESENTED");
//      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [presenter dismissTopViewControllerAnimated:YES completion:nil];
//      });
//    }];
//  }
//  
//}

//-(IBAction)tapShowNavigationOverStatusBar:(id)sender; {
//  SHPresenterBlocks * presenter = [SHPresenterBlocks presenterWithName:@"navigationBar1"];
//  presenter.frame = CGRectMake(0, 0, 320, 66);
//  for (NSInteger i = 1; i != 3; i++) {
//    SHStatusBarNotificationController * vc = SHStatusBarNotificationController.new;
//    vc.title = nil;
//    vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//    NSInteger aRedValue = arc4random()%255;
//    NSInteger aGreenValue = arc4random()%255;
//    NSInteger aBlueValue = arc4random()%255;
//    
//    UIColor *randColor = [UIColor colorWithRed:aRedValue/255.0f green:aGreenValue/255.0f blue:aBlueValue/255.0f alpha:1.0f];
//    
//    vc.view.backgroundColor = randColor;
//    
//    [presenter enqueueViewController:vc windowLevel:UIWindowLevelNormal animated:YES completion:^(UIViewController *controller) {
//      NSLog(@"PRESENTED");
//      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [presenter dismissTopViewControllerAnimated:YES completion:nil];
//      });
//    }];
//  }
//  
//}

//-(IBAction)tapShowNavigationUnderStatusBar:(id)sender; {
//  SHPresenterBlocks * presenter = [SHPresenterBlocks presenterWithName:@"navigationBar2"];
//  presenter.frame = CGRectMake(0, 22, 320, 44);
//  for (NSInteger i = 1; i != 3; i++) {
//    SHStatusBarNotificationController * vc = SHStatusBarNotificationController.new;
//    vc.alertTitle = [NSString stringWithFormat:@"Alert %@ of %@", @(i), @(3)];
//    vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//    NSInteger aRedValue = arc4random()%255;
//    NSInteger aGreenValue = arc4random()%255;
//    NSInteger aBlueValue = arc4random()%255;
//    
//    UIColor *randColor = [UIColor colorWithRed:aRedValue/255.0f green:aGreenValue/255.0f blue:aBlueValue/255.0f alpha:1.0f];
//    
//    vc.view.backgroundColor = randColor;
//    
//    [presenter enqueueViewController:vc windowLevel:UIWindowLevelNormal animated:YES completion:^(UIViewController *controller) {
//      NSLog(@"PRESENTED");
//    }];
//  }
//  
//}


-(IBAction)tapRemoveTopLayer:(id)sender; {
  
}

-(IBAction)tapRemoveAllLayers:(id)sender; {
  
}


@end