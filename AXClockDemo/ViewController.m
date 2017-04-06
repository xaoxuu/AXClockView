//
//  ViewController.m
//  AXClockDemo
//
//  Created by xaoxuu on 05/04/2017.
//  Copyright © 2017 Titan Studio. All rights reserved.
//

#import "ViewController.h"
//#import "AXClock.h"
#import "AXLocalClockView.h"
#import "AXTwoCitiesClockView.h"


@interface ViewController ()
// @xaoxuu:
@property (strong, nonatomic) AXLocalClockView *clockView;

@property (strong, nonatomic) AXTwoCitiesClockView *clockView2;

@property (weak, nonatomic) IBOutlet UILabel *lb_timeZone;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AXLocalClockView *clock = [AXLocalClockView clockWithFrame:CGRectMake(50, 100, 300, 300) dialPalte:@"palte" centerCircle:@"clock_center_i6" hourHand:@"hour_hand_i6" minuteHand:@"minute_hand_i6" secondHand:@"second_hand_i6"];
    [self.view addSubview:clock];
    clock.center = CGPointMake(0.5*self.view.frame.size.width, 0.5*self.view.frame.size.height);
    
    self.clockView = clock;
    
    
    AXTwoCitiesClockView *clock2 = [AXTwoCitiesClockView clockWithFrame:CGRectMake(50, 100, 300, 300) dialPalte:@"palte" centerCircle:@"clock_center_i6"  hourHand:@"hour_hand_i6" otherCityHour:@"second_hand_i6"];
    [self.view addSubview:clock2];
    clock2.center = CGPointMake(0.5*self.view.frame.size.width, 0.5*self.view.frame.size.height);
    
    self.clockView2 = clock2;
    self.clockView2.hidden = YES;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)mode:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex) {
        self.clockView.hidden = YES;
        self.clockView2.hidden = NO;
    } else{
        self.clockView.hidden = NO;
        self.clockView2.hidden = YES;
    }
}


- (IBAction)start:(UISwitch *)sender {
    if (sender.on) {
        [self.clockView resumeClock];
    } else {
        [self.clockView pauseClock];
    }
}
- (IBAction)slier:(UISlider *)sender {
    [self scale:sender.value];
    
}
- (IBAction)seg:(UISegmentedControl *)sender {
    self.clockView.secondHandMoveStyle = sender.selectedSegmentIndex;
}

- (IBAction)timeZone:(UISlider *)sender {
    self.clockView2.destinationTimeZone = (NSInteger)sender.value;
    
    self.lb_timeZone.text = [NSString stringWithFormat:@"时差：%ld",self.clockView2.destinationTimeZone];
    
}

- (void)scale:(CGFloat)scale{
    CGRect frame;
    frame.size.width = 100*scale;
    frame.size.height = 100*scale;
    self.clockView.frame = frame;
    self.clockView.center = self.view.center;
    
    self.clockView2.frame = frame;
    self.clockView2.center = self.view.center;
}


@end
