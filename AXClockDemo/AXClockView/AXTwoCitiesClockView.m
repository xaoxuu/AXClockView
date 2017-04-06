//
//  AXTwoCitiesClockView.m
//  AXClockDemo
//
//  Created by xaoxuu on 06/04/2017.
//  Copyright © 2017 Titan Studio. All rights reserved.
//

#import "AXTwoCitiesClockView.h"

@implementation AXTwoCitiesClockView

+ (instancetype)clockWithFrame:(CGRect)frame dialPalte:(NSString *)dialPalte centerCircle:(NSString *)centerCircle hourHand:(NSString *)hourHand otherCityHour:(NSString *)otherCityHour{
    return [[self alloc] initWithFrame:frame dialPalte:dialPalte centerCircle:centerCircle hourHand:hourHand otherCityHour:otherCityHour];
}
- (instancetype)initWithFrame:(CGRect)frame dialPalte:(NSString *)dialPalte centerCircle:(NSString *)centerCircle hourHand:(NSString *)hourHand otherCityHour:(NSString *)otherCityHour{
    if (self = [self initWithFrame:frame]) {
        
        self.img_dialPlate = [[UIImageView alloc] initWithImage:[UIImage imageNamed:dialPalte]];
        self.img_hourHand = [[UIImageView alloc] initWithImage:[UIImage imageNamed:hourHand]];
        self.img_otherCityHourHand = [[UIImageView alloc] initWithImage:[UIImage imageNamed:otherCityHour]];
        self.img_centerCircle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:centerCircle]];
        
        [self addSubview:self.img_dialPlate];
        [self addSubview:self.img_hourHand];
        [self addSubview:self.img_otherCityHourHand];
        [self addSubview:self.img_centerCircle];
        
        self.destinationTimeZone = 12;
        
    }
    return self;
}


- (void)clockUpdateHandToDate:(NSDate *)date{
    
    CGFloat hour24Ratio = date.hour / 24.0f;
    const CGFloat minute24Ratio = 0.5 * date.minuteRatio;
    // @xaoxuu: 本地时针
    switch (self.originLocation) {
        case AXHandOriginLocationTop:
            
            break;
        case AXHandOriginLocationBottom:
            hour24Ratio += 0.5;
            break;
    }
    [self setAngle:(M_2PI*hour24Ratio)+(M_2PI/24.0*minute24Ratio) forHand:self.img_hourHand];
    // @xaoxuu: 异地时针
    hour24Ratio = [date hourWithTimeZone:self.destinationTimeZone]/24.0;
    switch (self.originLocation) {
        case AXHandOriginLocationTop:
            
            break;
        case AXHandOriginLocationBottom:
            hour24Ratio += 0.5;
            break;
    }
    [self setAngle:(M_2PI*hour24Ratio)+(M_2PI/24.0*minute24Ratio) forHand:self.img_otherCityHourHand];
    
}


@end
