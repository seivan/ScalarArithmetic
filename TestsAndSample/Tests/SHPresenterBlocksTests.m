//
//  SHPresenterBlocksSelectorTests.m
//  Sample
//
//  Created by Seivan Heidari on 2014-03-19.
//  Copyright (c) 2014 Seivan. All rights reserved.
//

#import "SHPresenterBlocksTestsSuper.h"

@interface SHPresenterBlocksTests : SHPresenterBlocksTestsSuper

@end

@implementation SHPresenterBlocksTests

-(void)testPresenterWithName; {
  XCTAssertNil(self.presenter);
  self.presenter = [self defaultPresenter];
  XCTAssertNotNil(self.presenter);
  XCTAssertEqualObjects(self.presenter, [self defaultPresenter]);
  XCTAssertEqualObjects(self.presenterName, self.presenter.name);
}

-(void)testPresentViewController; {
  [tester waitForViewWithAccessibilityLabel:self.nameOnInitialWindow];
  self.presenter = [self defaultPresenter];
  __block BOOL didAssertNotification = NO;
  __block BOOL didAssertCompletion = NO;
  XCTAssertNotNil(self.vc);
  XCTAssertNil(self.vc.presentingViewController);
  [[NSNotificationCenter defaultCenter] addObserverForName:UIWindowDidBecomeVisibleNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
    XCTAssertNotNil(self.vc.presentingViewController);
    didAssertNotification = YES;
  }];
  [self.presenter presentViewController:self.vc windowLevel:UIWindowLevelAlert animated:YES completion:^(UIViewController *controller) {
    XCTAssertEqualObjects(self.vc, controller);
    didAssertCompletion = YES;
  }];
  [tester waitForAbsenceOfViewWithAccessibilityLabel:self.nameOnInitialWindow];
  [tester waitForViewWithAccessibilityLabel:self.presenterName];
  XCTAssertTrue(didAssertCompletion);
  XCTAssertTrue(didAssertNotification);
  
}

@end
