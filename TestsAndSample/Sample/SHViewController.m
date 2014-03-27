//
//  SHViewController.m
//  Example
//
//  Created by Seivan Heidari on 5/14/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//

@interface UIImage (Private)
+(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
+(UIImage *)imageWithColor:(UIColor *)color;
@end

@implementation UIImage (Private)
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
  UIGraphicsBeginImageContext(size);
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  CGContextSetFillColorWithColor(context, color.CGColor);
  CGContextFillRect(context, (CGRect){.size = size});
  
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
  return [UIImage imageWithColor:color size:CGSizeMake(1, 1)];
}

@end
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
  
  [SHAlertViewController setLayoutWithPaddingType:SHAVCPaddingTopToNext padding:15];
  [SHAlertViewController setLayoutWithPaddingType:SHAVCPaddingTitleToNext padding:5];
  [SHAlertViewController setLayoutWithPaddingType:SHAVCPaddingMessageToNext padding:15];
  [SHAlertViewController setLayoutWithPaddingType:SHAVCPaddingButtonToNext padding:10];
  [SHAlertViewController setLayoutWithPaddingType:SHAVCPaddingHorizontalButtonToSide padding:15];
  [SHAlertViewController setLayoutWithPaddingType:SHAVCPaddingBottomToPrevious padding:25];


  [SHAlertViewController styleAlertAnimationBlock:^(UIView *alertView) {
    alertView.layer.affineTransform = CGAffineTransformMakeTranslation(0, CGRectGetHeight([UIScreen mainScreen].bounds)*-1);
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1 options:UIViewAnimationOptionAllowUserInteraction animations:^{
      alertView.layer.affineTransform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
      alertView.layer.affineTransform = CGAffineTransformIdentity;
    }];

  }];
  
  
  [SHAlertViewController styleAlertContentBlock:^id(NSInteger index, UILabel *lblContent) {
    if(index == 0) lblContent = UITextField.new;
    lblContent.textColor = [UIColor blackColor];
    lblContent.textAlignment = NSTextAlignmentCenter;
    if(index == 0)    lblContent.font = [UIFont boldSystemFontOfSize:20.f];
    else lblContent.font = [UIFont systemFontOfSize:15.f];
    return lblContent;

  }];

  [SHAlertViewController styleAlertButtonBlock:^UIControl *(NSInteger index, UIButton *button) {
    button.backgroundColor = [UIColor whiteColor];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:20.f];
    if(index == 0) [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    else [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
    [button addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button(==40)]" options:kNilOptions metrics:nil views:NSDictionaryOfVariableBindings(button)]];
    button.layer.cornerRadius = 20.f;
    button.layer.borderWidth = 3;
    button.layer.borderColor = [UIColor blackColor].CGColor;
    return button;
  }];
  
  [SHAlertViewController styleAlertViewBlock:^UIView *(UIView *alertView) {
    alertView.backgroundColor = [UIColor whiteColor];
    alertView.layer.cornerRadius = 5.0;
    alertView.layer.shadowColor = [UIColor blackColor].CGColor;
    alertView.layer.shadowOpacity = 0.25;
    alertView.layer.shadowRadius = 1;
    alertView.layer.shadowOffset = CGSizeMake(0, 1);
    
    return alertView;
  }];
  

}
-(void)viewDidAppear:(BOOL)animated; {
  [super viewDidAppear:animated];

}

-(void)removeAlert:(UITapGestureRecognizer *)tap; {

  

}

-(IBAction)tapShowAlert:(id)sender; {

  for (NSInteger i = 0; i != 5; i++) {
    NSString * title = [NSString stringWithFormat:@"Title %@ of %@", @(i+1), @(3)];
    SHAlertViewController * vc = [SHAlertViewController
                                  alertWithTitle:title
                                  message:@"This is a message"
                                  buttonTitles:@[@"Delete", @"Cancel"]
                                  completion:^(NSInteger buttonIndex) {
                                    NSLog(@"init: %@", @(buttonIndex));
                                  }];
    
    [vc addButtonWithTitle:@"I Should be last" completion:^(NSInteger buttonIndex) {
      NSLog(@"I am last");
    }];
    [vc show];
  }
}
-(IBAction)tapRemoveTopLayer:(id)sender; {
  
}

-(IBAction)tapRemoveAllLayers:(id)sender; {
  
}


@end