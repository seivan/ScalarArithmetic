

typedef void (^SHAlertViewControllerCompletionBlock)(NSInteger buttonIndex);

typedef NS_ENUM(NSInteger, SHAVCPadding)  {
  SHAVCPaddingTopToNext,
  SHAVCPaddingTitleToNext,
  SHAVCPaddingMessageToNext,
  SHAVCPaddingButtonToNext,
  SHAVCPaddingBottomToPrevious,
  SHAVCPaddingHorizontalTitleToSide,
  SHAVCPaddingHorizontalMessageToSide,
  SHAVCPaddingHorizontalButtonToSide
};

@interface SHAlertViewController : UIViewController

@property(nonatomic,copy) NSString * message;

@property(nonatomic,copy) NSAttributedString * attributedTitle;
@property(nonatomic,copy) NSAttributedString * attributedMessage;


@property(nonatomic,weak) id<UIAlertViewDelegate> delegate;

@property(nonatomic,readonly) NSInteger numberOfButtons;
@property(nonatomic,assign)   NSInteger cancelButtonIndex;
@property(nonatomic,readonly) NSInteger firstOtherButtonIndex;

@property(nonatomic,readonly,getter=isVisible) BOOL visible;


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


@interface SHAlertViewController (SHAlertViewControllerStyling)

typedef UIView * (^SHAlertViewControllerCreateAlertBlock)(UIView * alertView);
+(void)styleAlertViewBlock:(SHAlertViewControllerCreateAlertBlock)completionHandler;

typedef id (^SHAlertViewControllerCreateContentHolderBlock)(NSInteger index, UILabel * lblContent);
+(void)styleAlertContentBlock:(SHAlertViewControllerCreateContentHolderBlock)completionHandler;

typedef UIControl * (^SHAlertViewControllerCreateButtonBlock)(NSInteger index, UIButton * button);
+(void)styleAlertButtonBlock:(SHAlertViewControllerCreateButtonBlock)completionHandler;

typedef void (^SHAlertViewControllerAnimationBlock)(UIView * alertView);
+(void)styleAlertAnimationBlock:(SHAlertViewControllerAnimationBlock)theAnimation;

+(void)setLayoutWithPaddingType:(SHAVCPadding)thePaddingType padding:(CGFloat)thePadding;
@end