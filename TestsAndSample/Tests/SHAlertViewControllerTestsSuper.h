//
//  ExampleTests.m
//  ExampleTests
//
//  Created by Seivan Heidari on 7/27/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//


#define KIF_XCTEST

#import <XCTest/XCTest.h>
#import "KIF.h"
#import "SHTestCaseAdditions.h"
#import "SHPresenterBlocks.h"

@interface SHPresenterBlocksTestsSuper : KIFTestCase

@property(nonatomic,strong) UIViewController           * vc;
@property(nonatomic,strong) SHPresenterBlocks          * presenter;
@property(nonatomic,copy)   NSString                   * presenterName;
@property(nonatomic,copy)   NSString                   * nameOnInitialWindow;

-(SHPresenterBlocks *)defaultPresenter;
@end

