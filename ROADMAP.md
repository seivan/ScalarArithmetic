@property(nonatomic,strong) UIView   * alertView UI_APPEARANCE_SELECTOR;
@property(nonatomic,strong) UILabel  * lblTitle UI_APPEARANCE_SELECTOR;
@property(nonatomic,strong) UILabel  * lblMessage UI_APPEARANCE_SELECTOR;

@property(nonatomic,assign, getter = isTwoButtonColumns) BOOL twoButtonColumns UI_APPEARANCE_SELECTOR;

@property(nonatomic,assign) CGFloat paddingTitleToTop UI_APPEARANCE_SELECTOR;
@property(nonatomic,assign) CGFloat paddingTitleToMessage UI_APPEARANCE_SELECTOR;
@property(nonatomic,assign) CGFloat paddingMessageToButton UI_APPEARANCE_SELECTOR;
@property(nonatomic,assign) CGFloat paddingButtons UI_APPEARANCE_SELECTOR;
@property(nonatomic,assign) CGFloat paddingButtonToBottom UI_APPEARANCE_SELECTOR;

@property(nonatomic,assign) CGFloat paddingHorizontalTitleToSide UI_APPEARANCE_SELECTOR;
@property(nonatomic,assign) CGFloat paddingHorizontalMessageToSide UI_APPEARANCE_SELECTOR;
@property(nonatomic,assign) CGFloat paddingHorizontalButtons UI_APPEARANCE_SELECTOR;
@property(nonatomic,assign) CGFloat paddingHorizontalButtonToSide UI_APPEARANCE_SELECTOR;
