//
//  ExampleTests.m
//  ExampleTests
//
//  Created by Seivan Heidari on 7/27/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//



#import "SHPresenterBlocksTestsSuper.h"

@implementation SHPresenterBlocksTestsSuper

-(void)beforeEach; {
  self.vc = UIViewController.new;
  self.presenterName = @"Seivan is Bored";
  
  UILabel * lblFirst  = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 250, 50)];
  lblFirst.text  = self.presenterName;
  [self.vc.view addSubview:lblFirst];
  
  self.nameOnInitialWindow = @"So this should not be visible";
  lblFirst  = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 250, 50)];
  lblFirst.text = self.nameOnInitialWindow;
  [UIApplication sharedApplication].keyWindow.rootViewController = UIViewController.new;
  [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:lblFirst];
  [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];


}

-(SHPresenterBlocks *)defaultPresenter; {
  return [SHPresenterBlocks presenterWithName:self.presenterName];
}

@end

