//
//  NYLNotificationBar.m
//  DIY_NotificationBar
//
//  Created by nyl on 2019/7/18.
//  Copyright © 2019 nieyinlong. All rights reserved.
//

#import "NYLNotificationBar.h"
#import <Masonry.h>

#define nyl_AppWindow       [UIApplication sharedApplication].delegate.window
#define nyl_ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define nyl_StatusBarH       ([UIApplication sharedApplication].statusBarFrame.size.height)

@interface NYLNotificationBar()

@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UILabel *subTitleLB;

@end

@implementation NYLNotificationBar

- (instancetype)init {
    return [self initWithFrame:CGRectMake(12, nyl_StatusBarH, nyl_ScreenWidth - 24, 0)];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionTagGes)];
        [self addGestureRecognizer:tapGes];
        
        UISwipeGestureRecognizer *swipeGes = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hideWithAnimate)];
        swipeGes.direction = UISwipeGestureRecognizerDirectionUp;
        [self addGestureRecognizer:swipeGes];
    }
    return self;
}

- (void)initUI {
    _titleColor = [UIColor whiteColor];
    
    self.backgroundColor = [UIColor blackColor];
    self.layer.cornerRadius = 10;
    self.alpha = 0.96f;
    
    _titleLB = [UILabel new];
    _titleLB.textColor = _titleColor;
    _titleLB.font = [UIFont systemFontOfSize:18];
    [self addSubview:_titleLB];
    
    _subTitleLB = [UILabel new];
    _subTitleLB.textColor = _titleColor;
    _subTitleLB.font = [UIFont systemFontOfSize:15];
    [self addSubview:_subTitleLB];
    
    
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(14);
        make.right.mas_equalTo(-14);
        make.top.mas_equalTo(17);
    }];
    
    [_subTitleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(14);
        make.right.mas_equalTo(-14);
        make.bottom.mas_equalTo(-17);
    }];
   
}

- (void)show {
    NSLog(@"kAppWindow.subviews = %@", nyl_AppWindow.subviews);
    for (UIView *subView in nyl_AppWindow.subviews) {
        if ([subView isKindOfClass:[self class]]) {
            [subView removeFromSuperview];
        }
    }
    [nyl_AppWindow addSubview:self];
    CGRect changeFrame = self.frame;
    changeFrame.size.height = 88;
//    [UIView animateWithDuration:0.3 animations:^{
//        self.frame = changeFrame;
//    }];
    // 弹簧动画
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:1 options:0 animations:^{
        self.frame = changeFrame;
    } completion:nil];
}


- (void)hideWithAnimate {
    self.titleLB.text = nil;
    self.subTitleLB.text = nil;
    CGRect changeFrame = self.frame;
    changeFrame.size.height = 0;
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = changeFrame;
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.35 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
    });
}

- (void)actionTagGes {
    [self hideWithAnimate];
    if (self.clickBarBlock) {
        self.clickBarBlock();
    }
}

- (void)showWithTitle:(NSString *)title subTitle:(NSString *)subTitle {
    [self show];
    _titleLB.text = title;
    _subTitleLB.text = subTitle;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hideWithAnimate];
    });
}


@end
