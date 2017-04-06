//
//  AXClockView.m
//  AXClockDemo
//
//  Created by xaoxuu on 06/04/2017.
//  Copyright © 2017 Titan Studio. All rights reserved.
//

#import "AXClockView.h"


@interface AXClockView ()

@property (strong, nonatomic) CADisplayLink *timer;
@property (assign, nonatomic) BOOL canUpdateHand;
/**
 动画
 */
@property (strong, nonatomic) CABasicAnimation *animation;

@end


@implementation AXClockView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _canUpdateHand = YES;
        _animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        
        _timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
        [_timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self eachSubview:[UIImageView class] action:^(__kindof UIView *subview) {
        if (self.img_dialPlate.frame.size.width) {
            CGFloat radio = self.frame.size.width / self.img_dialPlate.frame.size.width;
            [self eachSubview:[UIImageView class] action:^(__kindof UIView *subview) {
                CGRect frame = subview.frame;
                frame.size.width *= radio;
                frame.size.height *= radio;
                subview.frame = frame;
            }];
        }
        subview.center = CGPointMake(0.5*self.frame.size.width, 0.5*self.frame.size.height);
    }];
}


- (void)clockUpdateHandToDate:(NSDate *)date{
    [self setAngle:M_2PI*date.hourRatio + (M_2PI/12.0*date.minuteRatio) forHand:self.img_hourHand];
    [self setAngle:M_2PI*date.minuteRatio + (M_2PI/60.0*date.secondRatio) forHand:self.img_minuteHand];
    switch (self.secondHandMoveStyle) {
        case AXSecondHandMoveStyleSlide:
            [self setAngle:M_2PI*date.secondRatio + M_2PI/60.0*date.nanoSecondRatio forHand:self.img_secondHand];
            break;
        case AXSecondHandMoveStyleStep:
            [self setAngle:M_2PI*date.secondRatio forHand:self.img_secondHand];
            break;
    }
    
}


- (void)setAngle:(CGFloat)floatAngle forHand:(UIImageView *)imgv{
    NSNumber *angle = @(floatAngle);
    self.animation.fromValue = angle;
    self.animation.toValue = angle;
    [imgv.layer addAnimation:self.animation forKey:@"rotation"];
}

- (void)update{
    if (_canUpdateHand){
        [self clockUpdateHandToDate:[NSDate date]];
    }
}

- (void)resumeClock{
    [self.timer setPaused:NO];
}

- (void)pauseClock{
    [self.timer setPaused:YES];
}


- (void)eachSubview:(Class)subClass action:(void (^)(__kindof UIView *subview))action {
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subview, NSUInteger idx, BOOL *stop) {
        if (subview && action) {
            if (!subClass || [subview isKindOfClass:subClass]) {
                action(subview);
            }
        }
    }];
}

@end

#pragma mark - util

@implementation NSDate (AXClockExtension)


- (NSDateFormatter *)sharedFormatter{
    static NSDateFormatter *_sharedF = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedF = [NSDateFormatter new];
        _sharedF.dateFormat = @"HH:mm:ss:SSS";
    });
    return _sharedF;
}

- (NSArray *)timeArray{
    return [[[self sharedFormatter] stringFromDate:self] componentsSeparatedByString:@":"];
}

- (NSInteger)hour{
    return [[self timeArray][0] integerValue];
}

- (NSInteger)minute{
    return [[self timeArray][1] integerValue];
}

- (NSInteger)second{
    return [[self timeArray][2] integerValue];
}

- (NSInteger)nanoSecond{
    return [[self timeArray][3] integerValue];
}


- (NSInteger)hourWithTimeZone:(NSInteger)zone{
    NSUInteger hour = self.hour;
    return hour + zone;
}

- (CGFloat)hourRatio{
    NSInteger hour = self.hour;
    if (hour > 12){
        hour -= 12;
    }
    return hour / 12.0f;
}
- (CGFloat)minuteRatio{
    return self.minute / 60.0f;
}
- (CGFloat)secondRatio{
    return self.second / 60.0f;
}
- (CGFloat)nanoSecondRatio{
    return self.nanoSecond / 1000.0f;
}



@end

