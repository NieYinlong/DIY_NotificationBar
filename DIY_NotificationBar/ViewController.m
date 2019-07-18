//
//  ViewController.m
//  DIY_NotificationBar
//
//  Created by nyl on 2019/7/18.
//  Copyright © 2019 nieyinlong. All rights reserved.
//

#import "ViewController.h"
#import "NYLNotificationBar.h"

@interface ViewController ()

@property (nonatomic, assign) NSInteger atIndex;
@property (nonatomic, strong) NYLNotificationBar *bar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.frame = CGRectMake(100, 280, 200, 100);
    [btn setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(actionBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    [btn setTitle:@"点击弹出bar" forState:(UIControlStateNormal)];
    [self.view addSubview:btn];
    
    _atIndex = 0;
}


- (void)actionBtnClick {
    NYLNotificationBar *bar =[[NYLNotificationBar alloc] init];
    bar.backgroundColor = [UIColor blackColor];
    bar.titleColor = [UIColor whiteColor];
    _atIndex++;
    [bar showWithTitle:@"这是标题" subTitle:[NSString stringWithFormat:@"这是内容%ld", _atIndex]];
    bar.clickBarBlock = ^{
      // 点击通知栏回调
    };
}


@end
