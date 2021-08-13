//
//  ViewController.m
//  AsteroomTest
//
//  Created by Sunny Ladkani on 8/12/21.
//

#import "ViewController.h"
#import "SEGAnalytics.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)trackButtonPress:(id)sender {
    [[SEGAnalytics sharedAnalytics] track:@"cleverTapSegmentTrackEvent"
                               properties:@{ @"eventproperty": @"eventPropertyValue",
                                             @"testPlan": @"Pro",
                                             @"testEvArr": @[@1,@2,@3]}];
}

@end
