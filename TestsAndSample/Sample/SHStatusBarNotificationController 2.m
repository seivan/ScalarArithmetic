
#import "SHStatusBarNotificationController.h"
@import QuartzCore;

@interface SHStatusBarNotificationController ()
@property(nonatomic,strong) UILabel  * lblAlertTitle;
@end


@implementation SHStatusBarNotificationController

-(instancetype)init; {
  self = [super init];
  if(self) {

    self.lblAlertTitle                 = [[UILabel alloc] initWithFrame:CGRectZero];
    self.lblAlertTitle.text            = @"Something about alert";
    self.lblAlertTitle.font            = [UIFont boldSystemFontOfSize:14];
    self.lblAlertTitle.textColor       = [UIColor whiteColor];
    self.lblAlertTitle.textAlignment   = NSTextAlignmentCenter;
    self.lblAlertTitle.numberOfLines   = 0;

    
  }
  return self;
}

-(void)viewDidLoad; {
  [super viewDidLoad];
  self.view.backgroundColor          = [UIColor redColor];
  [self.view addSubview:self.lblAlertTitle];
}

-(void)viewWillAppear:(BOOL)animated; {
  [super viewWillAppear:animated];
  self.view.frame = CGRectMake(0, 0, 320, 22);

}

-(void)viewDidAppear:(BOOL)animated; {
  [super viewDidAppear:animated];
}


#pragma mark - Properties

-(void)setTitle:(NSString *)title; {
  [super setTitle:title];
  self.lblAlertTitle.text = title;
}


#pragma mark - Actions

-(void)dismissButtonClicked; {
  [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}



@end
