# AXClockView
> 简单的动态时钟表盘，支持自定义

![](resources/2017-04-06 15_34_14.gif)

## 开始使用
下载仓库，将`AXClockView/`文件夹里的文件复制到项目中。
导入头文件：

```objective-c
#import "AXClockView.h"
```

创建本地时钟：

```objective-c
CGRect frame = CGRectMake(50, 100, 300, 300);
AXLocalClockView *clock = [AXLocalClockView clockWithFrame:frame dialPalte:@"palte" centerCircle:@"clock_center_i6" hourHand:@"hour_hand_i6" minuteHand:@"minute_hand_i6" secondHand:@"second_hand_i6"];
[self.view addSubview:clock];
```

创建两地时时钟：

```objective-c
CGRect frame = CGRectMake(50, 100, 300, 300);
AXTwoCitiesClockView *clock = [AXTwoCitiesClockView clockWithFrame:frame dialPalte:@"palte" centerCircle:@"clock_center_i6" hourHand:@"hour_hand_i6" minuteHand:@"minute_hand_i6" secondHand:@"second_hand_i6"];
[self.view addSubview:clock];
// 指定时区时差(与本地时的时差)
clock.destinationTimeZone = 8;
```



## 起因

工作中遇到这样一个需求，要求界面上显示一个动态的时钟，支持更换表盘图片、更换指针。

要求支持两地时功能：同时显示两地时间，一圈为24个小时，还要求0点从下面开始(⊙﹏⊙)b（也就是普通表盘的6点钟方向）

为了扩展方便，我将0点从上方开始设置为默认值，如果需要从下方开始，就设置指针起始点为bottom：

```objective-c
self.clockView.originLocation = AXHandOriginLocationBottom;
```

## 注

一般情况下，我们只需要用到本地时钟就够了

## 参考

本项目参考了[@zhenlintie](https://github.com/zhenlintie/STClock)的仿锤子时钟，并删掉了pop动画，精简结构，如果需要更有动感的时钟，请直接看原作者的源码[@zhenlintie](https://github.com/zhenlintie/STClock)。