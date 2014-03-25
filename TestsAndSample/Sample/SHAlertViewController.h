

typedef void (^SHAlertViewControllerCompletionBlock)(NSInteger buttonIndex);


@interface SHAlertViewController : UIViewController

@property(nonatomic,copy) NSString * message;

@property(nonatomic,weak) id<UIAlertViewDelegate> delegate;

@property(nonatomic,readonly) NSInteger numberOfButtons;
@property(nonatomic,assign)   NSInteger cancelButtonIndex;
@property(nonatomic,readonly) NSInteger firstOtherButtonIndex;

@property(nonatomic,readonly,getter=isVisible) BOOL visible;

typedef UIView * (^SHAlertViewControllerCreateAlertBlock)(UIView * alertView);
+(void)styleAlertViewWithCompletionHandler:(SHAlertViewControllerCreateAlertBlock)completionHandler;

typedef UIView * (^SHAlertViewControllerCreateContentHolderBlock)(NSInteger index, UILabel * lblContent);
+(void)styleAlertContentWithCompletionHandler:(SHAlertViewControllerCreateContentHolderBlock)completionHandler;

typedef UIView * (^SHAlertViewControllerCreateButtonBlock)(NSInteger index, UIButton * button);
+(void)styleAlertButtonWithCompletionHandler:(SHAlertViewControllerCreateButtonBlock)completionHandler;

+(instancetype)alertWithTitle:(NSString *)theTitle
                      message:(NSString *)theMessage
                 buttonTitles:(NSArray *)theButtonTitles
                   completion:(SHAlertViewControllerCompletionBlock)theCompletion;


-(void)addButtonWithTitle:(NSString *)theButtonTitle
               completion:(SHAlertViewControllerCompletionBlock)theCompletion;

-(void)show;
-(void)dismissWithTappedButtonIndex:(NSInteger)theButtonIndex animated:(BOOL)theAnimatedFlag;

-(NSString *)buttonTitleAtIndex:(NSInteger)theButtonIndex;
-(NSInteger)addButtonWithTitle:(NSString *)title;
@end
