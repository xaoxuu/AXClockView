# AXClockView
简单的动态时钟表盘，支持自定义


工作中遇到这样一个需求，要求界面上显示一个动态的时钟，支持更换表盘图片、更换指针。

要求支持两地时功能：同时显示两地时间，一圈为24个小时，还要求0点从下面开始(⊙﹏⊙)b（也就是普通表盘的6点钟方向）

为了扩展方便，我将0点从上方开始设置为默认值，如果需要从下方开始，就设置指针起始点为bottom：
```objective-c
self.clockView.originLocation = AXHandOriginLocationBottom;
```

## ：

一般情况下，我们只需要用到本地时钟就够了