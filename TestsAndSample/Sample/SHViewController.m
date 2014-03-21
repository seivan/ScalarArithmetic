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

}
-(void)viewDidAppear:(BOOL)animated; {
  [super viewDidAppear:animated];

}

-(void)removeAlert:(UITapGestureRecognizer *)tap; {

  [[SHPresenterBlocks presenter] dismissViewController:[SHPresenterBlocks presenter].topViewController animated:YES completion:^(UIViewController *controller) {
    
    NSLog(@"DISMISSED");
  }];

}

-(IBAction)tapShowAlert:(id)sender; {
  SHPresenterBlocks * presenter = [SHPresenterBlocks presenterWithName:@"alert"];

  for (NSInteger i = 1; i != 2; i++) {
//    SHAlertViewController * vc = SHAlertViewController.new;
//    vc.title = [NSString stringWithFormat:@"Title %@ of %@", @(i), @(3)];
//    vc.message = [NSString stringWithFormat:@"Message %@ of %@", @(i), @(3)];
    NSString * title = [NSString stringWithFormat:@"Title %@ of %@", @(i), @(3)];
    SHAlertViewController * vc = [SHAlertViewController alertWithTitle:title message:@"Message" buttonTitles:@[@"Damn"] completion:^(NSInteger buttonIndex) {
      NSLog(@"init: %@", @(buttonIndex));
    }];


    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeAlert:)];

    [vc.view addGestureRecognizer:tap];
    [vc addButtonWithTitle:@"CANCEL" completion:^(NSInteger buttonIndex) {
      NSLog(@"%@", @(buttonIndex));
    }];
    [vc addButtonWithTitle:@"OK" completion:^(NSInteger buttonIndex) {
      NSLog(@"%@", @(buttonIndex));
    }];
    [vc addButtonWithTitle:@"WAT?" completion:^(NSInteger buttonIndex) {
      NSLog(@"%@", @(buttonIndex));
    }];


    [presenter enqueueViewController:vc windowLevel:UIWindowLevelAlert animated:NO completion:^(UIViewController *controller) {
      NSLog(@"PRESENTED");
    }];
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