//
//  AXTwoCitiesClockView.h
//  AXClockDemo
//
//  Created by xaoxuu on 06/04/2017.
//  Copyright © 2017 Titan Studio. All rights reserved.
//

#import "AXClockView.h"


/**
 指针开始的位置（0时的指针位置）

 - AXHandOriginLocationTop: 从顶部开始（正常模式）
 - AXHandOriginLocationBottom: 从底部开始（翻转模式）
 */
typedef NS_ENUM(NSUInteger, AXHandOriginLocation) {
    AXHandOriginLocationTop,
    AXHandOriginLocationBottom,
};

@interface AXTwoCitiesClockView : AXClockView

// @xaoxuu: second hand image
@property (strong, nonatomic) UIImageView *img_otherCityHourHand;

// @xaoxuu: 异地城市时差
@property (assign, nonatomic) NSInteger destinationTimeZone;

// @xaoxuu: 指针0时刻的位置
@property (assign, nonatomic) AXHandOriginLocation originLocation;

/**
 创建一个模拟时钟
 
 @param frame        frame
 @param dialPlate    表盘图片
 @param centerCircle 中心圈
 @param hourHand      时针
 @param otherCityHour 另一个城市的时针
 @return 时钟实例
 */
+ (instancetype)clockWithFrame:(CGRect)frame dialPlate:(NSString *)dialPlate centerCircle:(NSString *)centerCircle hourHand:(NSString *)hourHand otherCityHour:(NSString *)otherCityHour;


@end
