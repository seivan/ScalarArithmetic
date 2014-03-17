
#import "SHAlertViewController.h"
#import <SHPresenterBlocks.h>
@import QuartzCore;

@interface SHAlertViewController ()
@property(nonatomic,strong)   NSMapTable * buttonCallbacks;
@property(nonatomic,readonly) NSArray    * buttons;
@property(nonatomic,strong) id observerToBackground;
@property(nonatomic,strong) UIView   * alertView;
@property(nonatomic,strong) UILabel  * lblTitle;
@property(nonatomic,strong) UILabel  * lblMessage;

@property(nonatomic,copy) SHAlertViewControllerCompletionBlock completion;
@property(nonatomic,weak)     SHPresenterBlocks * presenter;

@end


@implementation SHAlertViewController
+(instancetype)alertWithTitle:(NSString *)theTitle
                      message:(NSString *)theMessage
                 buttonTitles:(NSArray *)theButtonTitles
                   completion:(SHAlertViewControllerCompletionBlock)theCompletion; {
  SHAlertViewController * viewController = [[[self class] alloc] init];
  viewController.title = theTitle;
  viewController.message = theMessage;
  viewController.completion = theCompletion;
  [theButtonTitles enumerateObjectsUsingBlock:^(NSString * buttonTitle, __unused NSUInteger idx, __unused BOOL *stop) {
    [viewController addButtonWithTitle:buttonTitle completion:viewController.completion];
  }];

  return viewController;
}

-(instancetype)init; {
  self = [super init];
  if(self) {
    self.buttonCallbacks = [NSMapTable strongToWeakObjectsMapTable];
    self.presenter = [SHPresenterBlocks presenterWithName:@"com.SHAlertViewController.presenter"];
  }
  return self;
}

-(void)viewDidLoad; {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
  [self.view addSubview:self.alertView];
  [self.alertView addSubview:self.lblTitle];  
  [self.alertView addSubview:self.lblMessage];
  self.alertView.alpha = 0;
}

-(void)viewWillDisappear:(BOOL)animated; {
  [super viewWillDisappear:animated];
  [[NSNotificationCenter defaultCenter] removeObserver:self.observerToBackground];
}
-(void)viewDidAppear:(BOOL)animated; {
  [super viewDidAppear:animated];
  __weak typeof(self) weakSelf = self;
  self.observerToBackground = [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidEnterBackgroundNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
    if([weakSelf.delegate respondsToSelector:@selector(alertViewCancel:)])
      [weakSelf.delegate alertViewCancel:(UIAlertView *)weakSelf];
    else
      [weakSelf dismissWithTappedButtonIndex:-1 animated:animated];
  }];
  
  [UIView animateWithDuration:0.1 animations:^{self.alertView.alpha = 1.0;}];
  
  self.alertView.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1.0);
  
  CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
  bounceAnimation.values = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:0.5],
                            [NSNumber numberWithFloat:1.1],
                            [NSNumber numberWithFloat:0.8],
                            [NSNumber numberWithFloat:1.0], nil];
  bounceAnimation.duration = 0.3;
  bounceAnimation.removedOnCompletion = NO;
  [self.alertView.layer addAnimation:bounceAnimation forKey:@"bounce"];
  
  self.alertView.layer.transform = CATransform3DIdentity;
  
  //  [UIView animateWithDuration:0.1 animations:^{
  //    self.alertView.alpha = 1;
  //  }];
  //
  //  self.alertView.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1.0);
  //
  //  [UIView animateKeyframesWithDuration:0.3 delay:0 options:kNilOptions animations:^{
  //    [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.25 animations:^{
  //      self.alertView.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1.0);
  //    }];
  //    [UIView addKeyframeWithRelativeStartTime:0.25 relativeDuration:0.25 animations:^{
  //      self.alertView.layer.transform = CATransform3DMakeScale(1.1, 1.1, 1.0);
  //    }];
  //    [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.25 animations:^{
  //      self.alertView.layer.transform = CATransform3DMakeScale(0.8, 0.8, 1.0);
  //    }];
  //    [UIView addKeyframeWithRelativeStartTime:0.75 relativeDuration:0.25 animations:^{
  //      self.alertView.layer.transform = CATransform3DMakeScale(1.f, 1.f, 1.0);
  //    }];
  //
  //  } completion:^(BOOL finished) {
  //    self.alertView.layer.transform = CATransform3DIdentity;
  //  }];

}



#pragma mark - Layout

-(void)viewWillLayoutSubviews; {
  [super viewWillLayoutSubviews];
  

  
  [self.view addConstraint:  [NSLayoutConstraint constraintWithItem:self.alertView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.f constant:0.f]];
  
  
  NSArray * constraintForAlertView = [NSLayoutConstraint
                                      constraintsWithVisualFormat:@"V:|-(>=0)-[_alertView]"
                                      options: kNilOptions
                                      metrics:nil
                                      views:NSDictionaryOfVariableBindings(_alertView)];

  constraintForAlertView = [constraintForAlertView arrayByAddingObjectsFromArray:
                        [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_alertView]-|"
                                                                options: kNilOptions
                                                                metrics:nil
                                                                  views:NSDictionaryOfVariableBindings(_alertView)]
                        ];
  
  
  
  
  NSArray * constraintForTitle = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_lblTitle]-|"
                                                                         options:kNilOptions
                                                                         metrics:nil
                                                                           views:NSDictionaryOfVariableBindings(_lblTitle)];
  
  constraintForTitle = [constraintForTitle arrayByAddingObjectsFromArray:
                        [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_lblTitle]"
                                                                options:kNilOptions
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(_lblTitle)]
                        ];
  

  NSArray * constraintForMessage = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_lblMessage]-|"
                                                                         options:kNilOptions
                                                                         metrics:nil
                                                                           views:NSDictionaryOfVariableBindings(_lblMessage)];
  
  

  
  if(self.buttons.firstObject)
    constraintForMessage = [constraintForMessage arrayByAddingObjectsFromArray:
                        [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_lblTitle]-[_lblMessage]"
                                                                options:kNilOptions
                                                                metrics:nil
                                                                  views:NSDictionaryOfVariableBindings(_lblMessage, _lblTitle)]
                        ];
  else
    constraintForMessage = [constraintForMessage arrayByAddingObjectsFromArray:
                            [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_lblTitle]-[_lblMessage]-|"
                                                                    options:kNilOptions
                                                                    metrics:nil
                                                                      views:NSDictionaryOfVariableBindings(_lblMessage, _lblTitle)]
                            ];

  

  [self.view addConstraints:constraintForAlertView];
  [self.alertView addConstraints:constraintForTitle];
  [self.alertView addConstraints:constraintForMessage];
  [self.buttons enumerateObjectsUsingBlock:^(UIButton * button, NSUInteger idx, __unused BOOL *stop) {
    
    NSArray * constraintForButton = @[];
    
    constraintForButton =  [constraintForButton arrayByAddingObjectsFromArray:
                           [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[button]-|"
                                               options:kNilOptions
                                               metrics:nil
                                                 views:NSDictionaryOfVariableBindings(button)]];
    
    if(self.buttons.firstObject == button && self.buttons.lastObject == button)
      constraintForButton = [constraintForButton arrayByAddingObjectsFromArray:
                            [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_lblMessage]-[button]-|"
                                                                    options:kNilOptions
                                                                    metrics:nil
                                                                      views:NSDictionaryOfVariableBindings(_lblMessage, button)]
                            ];
    else if(self.buttons.firstObject == button)
      constraintForButton = [constraintForButton arrayByAddingObjectsFromArray:
                             [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_lblMessage]-[button]"
                                                                     options:kNilOptions
                                                                     metrics:nil
                                                                       views:NSDictionaryOfVariableBindings(_lblMessage, button)]
                             ];

    else if(self.buttons.lastObject == button) {
      UIButton * previousButton = self.buttons[idx-1];
      constraintForButton = [constraintForButton arrayByAddingObjectsFromArray:
                             [NSLayoutConstraint constraintsWithVisualFormat:@"V:[previousButton]-[button]-|"
                                                                     options:kNilOptions
                                                                     metrics:nil
                                                                       views:NSDictionaryOfVariableBindings(_lblMessage,previousButton,button)]
                             ];
    }
    else {
      UIButton * previousButton = self.buttons[idx-1];
      constraintForButton = [constraintForButton arrayByAddingObjectsFromArray:
                             [NSLayoutConstraint constraintsWithVisualFormat:@"V:[previousButton]-[button]"
                                                                     options:kNilOptions
                                                                     metrics:nil
                                                                       views:NSDictionaryOfVariableBindings(_lblMessage,previousButton,button)]
                             ];
    }


    
    [self.alertView addConstraints:constraintForButton];
    
  }];

  
  
  
  
}

-(void)addButtonWithTitle:(NSString *)theButtonTitle
               completion:(SHAlertViewControllerCompletionBlock)theCompletion; {
  UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
  button.translatesAutoresizingMaskIntoConstraints = NO;
  [button setTitle:theButtonTitle forState:UIControlStateNormal];
  [button addTarget:self action:@selector(tappedButton:) forControlEvents:UIControlEventTouchUpInside];
  [self.alertView addSubview:button];
  if(theCompletion) [self.buttonCallbacks setObject:theCompletion forKey:button];
}


-(void)tappedButton:(UIButton *)theButton; {
  NSInteger index = [self.buttons indexOfObject:theButton];
  SHAlertViewControllerCompletionBlock  block = [self.buttonCallbacks objectForKey:theButton];
  if(block) block(index);
  [self dismissWithTappedButtonIndex:index animated:YES];
  
}
#pragma mark - Properties

-(void)setTitle:(NSString *)title; {
  [super setTitle:title];
  self.lblTitle.text = title;
}

-(void)setMessage:(NSString *)message; {
  _message = message;
  self.lblMessage.text = message;
}


#pragma mark - Actions

-(void)dismissWithTappedButtonIndex:(NSInteger)theButtonIndex animated:(BOOL)theAnimatedFlag; {
  [self.delegate alertView:(UIAlertView *)self clickedButtonAtIndex:theButtonIndex];
  [self.delegate alertView:(UIAlertView *)self willDismissWithButtonIndex:theButtonIndex];

  __weak typeof(self) weakSelf = self;
  [self.presentingViewController dismissViewControllerAnimated:theAnimatedFlag completion:^{
    [weakSelf.delegate alertView:(UIAlertView *)weakSelf didDismissWithButtonIndex:theButtonIndex];
  }];
}

-(void)show; {
  [self.delegate willPresentAlertView:(UIAlertView *)self];
  [self.presenter enqueueViewController:self windowLevel:UIWindowLevelAlert animated:YES completion:^(UIViewController *controller) {
    [self.delegate didPresentAlertView:(UIAlertView *)self];
  }];
}




#pragma mark - Lazy Loading

-(UILabel *)lblTitle; {
  if (_lblTitle == nil) {
    _lblTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    _lblTitle.translatesAutoresizingMaskIntoConstraints = NO;
    _lblTitle.text = @"Alert Title!";
    _lblTitle.font = [UIFont boldSystemFontOfSize:14];
    _lblTitle.textColor = [UIColor orangeColor];
//    _lblTitle.backgroundColor = [UIColor greenColor];
    _lblTitle.textAlignment = NSTextAlignmentCenter;
    _lblTitle.numberOfLines = 0;
  }
  return _lblTitle;
}

-(UILabel *)lblMessage; {
  if (_lblMessage == nil) {
    _lblMessage = [[UILabel alloc] initWithFrame:CGRectZero];
    _lblMessage.translatesAutoresizingMaskIntoConstraints = NO;
    _lblMessage.text = @"Message!";
    _lblMessage.font = [UIFont systemFontOfSize:12];
    _lblMessage.textColor = [UIColor blackColor];
//    _lblMessage.backgroundColor = [UIColor greenColor];
    _lblMessage.textAlignment = NSTextAlignmentCenter;
    _lblMessage.numberOfLines = 0;
  }
  return _lblMessage;
}


-(UIView *)alertView; {
  if (_alertView == nil) {
    _alertView = [[UIView alloc] initWithFrame:CGRectZero];
    _alertView.translatesAutoresizingMaskIntoConstraints = NO;
    _alertView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.9];
    _alertView.layer.cornerRadius = 5.0;
    _alertView.layer.shadowColor = [UIColor blackColor].CGColor;
    _alertView.layer.shadowOpacity = 0.25;
    _alertView.layer.shadowRadius = 1;
    _alertView.layer.shadowOffset = CGSizeMake(0, 1);
  }
  return _alertView;
}

-(NSString *)buttonTitleAtIndex:(NSInteger)theButtonIndex; {
  UIButton * button = self.buttons[theButtonIndex];
  return [button titleForState:UIControlStateNormal];
}

-(NSInteger)addButtonWithTitle:(NSString *)title; {
  [self addButtonWithTitle:title completion:self.completion];
  return self.buttons.count-1;
}

-(NSArray *)buttons; {
  return [self.alertView.subviews filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
    return [evaluatedObject isKindOfClass:[UIButton class]];
  }]];
}

-(NSInteger)numberOfButtons; {
  return self.buttons.count;
}
//@property(nonatomic,readonly) NSInteger firstOtherButtonIndex;
-(BOOL)isVisible; {
  return self.presenter.topViewController == self;
}

@end
