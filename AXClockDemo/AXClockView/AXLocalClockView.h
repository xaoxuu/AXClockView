//
//  AXLocalClockView.h
//  AXClockDemo
//
//  Created by xaoxuu on 06/04/2017.
//  Copyright © 2017 Titan Studio. All rights reserved.
//

#import "AXClockView.h"


@interface AXLocalClockView : AXClockView




/**
 创建一个模拟时钟
 
 @param frame        frame
 @param dialPalte    表盘图片
 @param centerCircle 中心圈
 @param hourHand     时针
 @param minuteHand   分针
 @param secondHand   秒针
 @return 时钟实例
 */
+ (instancetype)clockWithFrame:(CGRect)frame dialPalte:(NSString *)dialPalte centerCircle:(NSString *)centerCircle hourHand:(NSString *)hourHand minuteHand:(NSString *)minuteHand secondHand:(NSString *)secondHand;

/**
 创建一个模拟时钟
 
 @param frame        frame
 @param dialPalte    表盘图片
 @param centerCircle 中心圈
 @param hourHand     时针
 @param minuteHand   分针
 @param secondHand   秒针
 @return 时钟实例
 */
- (instancetype)initWithFrame:(CGRect)frame dialPalte:(NSString *)dialPalte centerCircle:(NSString *)centerCircle hourHand:(NSString *)hourHand minuteHand:(NSString *)minuteHand secondHand:(NSString *)secondHand;





@end
