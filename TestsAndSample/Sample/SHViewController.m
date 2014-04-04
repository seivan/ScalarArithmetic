//
//  SHViewController.m
//  Example
//
//  Created by Seivan Heidari on 5/14/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//

#import "SHViewController.h"
#import <SHPresenterBlocks.h>
#import <SHAlertViewController.h>


@interface SHViewController ()

@end

@implementation SHViewController



-(IBAction)tapShowAlert:(id)sender; {

  NSInteger counter = 2;
  for (NSInteger i = 0; i != counter; i++) {
    NSString * title = [NSString stringWithFormat:@"Title %@ of %@", @(i+1), @(counter)];
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


@end