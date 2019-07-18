//
//  NYLNotificationBar.h
//  DIY_NotificationBar
//
//  Created by nyl on 2019/7/18.
//  Copyright © 2019 nieyinlong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NYLNotificationBar : UIView

@property (nonatomic, copy) void(^clickBarBlock)(void);

@property (nonatomic, strong) UIColor *titleColor;

- (void)showWithTitle:(NSString *)title subTitle:(NSString *)subTitle;

@end

NS_ASSUME_NONNULL_END
