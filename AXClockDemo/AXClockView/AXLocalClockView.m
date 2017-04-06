//
//  AXLocalClockView.m
//  AXClockDemo
//
//  Created by xaoxuu on 06/04/2017.
//  Copyright © 2017 Titan Studio. All rights reserved.
//

#import "AXLocalClockView.h"

@implementation AXLocalClockView


+ (instancetype)clockWithFrame:(CGRect)frame dialPalte:(NSString *)dialPalte centerCircle:(NSString *)centerCircle hourHand:(NSString *)hourHand minuteHand:(NSString *)minuteHand secondHand:(NSString *)secondHand{
    return [[self alloc] initWithFrame:frame dialPalte:dialPalte centerCircle:centerCircle hourHand:hourHand minuteHand:minuteHand secondHand:secondHand];
}

- (instancetype)initWithFrame:(CGRect)frame dialPalte:(NSString *)dialPalte centerCircle:(NSString *)centerCircle hourHand:(NSString *)hourHand minuteHand:(NSString *)minuteHand secondHand:(NSString *)secondHand{
    if (self = [self initWithFrame:frame]) {
        
        self.img_dialPlate = [[UIImageView alloc] initWithImage:[UIImage imageNamed:dialPalte]];
        self.img_hourHand = [[UIImageView alloc] initWithImage:[UIImage imageNamed:hourHand]];
        self.img_minuteHand = [[UIImageView alloc] initWithImage:[UIImage imageNamed:minuteHand]];
        self.img_secondHand = [[UIImageView alloc] initWithImage:[UIImage imageNamed:secondHand]];
        self.img_centerCircle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:centerCircle]];
        
        [self addSubview:self.img_dialPlate];
        [self addSubview:self.img_hourHand];
        [self addSubview:self.img_minuteHand];
        [self addSubview:self.img_secondHand];
        [self addSubview:self.img_centerCircle];
        
    }
    return self;
}


@end
