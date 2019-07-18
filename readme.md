## 自定义本地通知栏
自定义本地通知栏, 可以设置标题和子标题, 显示后3秒自动消失, 也可以利用手势滑动取消, 同时可以点击通知栏, 处理事件
#
#
![Image](https://github.com/NieYinlong/DIY_NotificationBar/blob/master/DIY_NotificationBar/bar.gif)

# 使用
```Objective-C
NYLNotificationBar *bar =[[NYLNotificationBar alloc] init];
bar.backgroundColor = [UIColor blackColor];
bar.titleColor = [UIColor whiteColor];
[bar showWithTitle:@"这是标题" subTitle:@"这是内容"];
bar.clickBarBlock = ^{
// 点击通知栏回调
};
```
