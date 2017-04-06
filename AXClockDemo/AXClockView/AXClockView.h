//
//  AXClockView.h
//  AXClockDemo
//
//  Created by xaoxuu on 06/04/2017.
//  Copyright © 2017 Titan Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

#define M_2PI 2*M_PI
/**
 秒针移动方式
 
 - AXSecondHandMoveStyleSlide: 平滑移动
 - AXSecondHandMoveStyleStep:  跳变
 */
typedef NS_ENUM(NSUInteger, AXSecondHandMoveStyle) {
    AXSecondHandMoveStyleSlide,
    AXSecondHandMoveStyleStep,
};
@interface AXClockView : UIView

/**
 表盘图片
 */
@property (strong, nonatomic) UIImageView *img_dialPlate;

/**
 中心圆圈图片
 */
@property (strong, nonatomic) UIImageView *img_centerCircle;

/**
 时针图片
 */
@property (strong, nonatomic) UIImageView *img_hourHand;

/**
 分针图片
 */
@property (strong, nonatomic) UIImageView *img_minuteHand;

/**
 秒针图片
 */
@property (strong, nonatomic) UIImageView *img_secondHand;


/**
 秒针移动方式
 */
@property (assign, nonatomic) AXSecondHandMoveStyle secondHandMoveStyle;


/**
 更新指针到某个时刻

 @param date 时间
 */
- (void)clockUpdateHandToDate:(NSDate *)date;

/**
 设置指针的角度

 @param floatAngle 角度
 @param imgv 指针
 */
- (void)setAngle:(CGFloat)floatAngle forHand:(UIImageView *)imgv;


/**
 恢复时钟
 */
- (void)resumeClock;

/**
 暂停时钟
 */
- (void)pauseClock;


@end

#pragma mark - util

@interface NSDate (AXClockExtension)

/**
 小时

 @return 小时
 */
- (NSInteger)hour;

/**
 异地的时间

 @param zone 时差
 @return 小时
 */
- (NSInteger)hourWithTimeZone:(NSInteger)zone;

- (CGFloat)hourRatio;
- (CGFloat)minuteRatio;
- (CGFloat)secondRatio;
- (CGFloat)nanoSecondRatio;


@end

#import "AXLocalClockView.h"
#import "AXTwoCitiesClockView.h"

