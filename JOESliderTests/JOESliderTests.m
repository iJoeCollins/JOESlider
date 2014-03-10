//
//  JOESliderTests.m
//  JOESliderTests
//
//  Created by Joseph Collins on 3/10/14.
//  Copyright (c) 2014 Joseph Collins. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JOESlider.h"

@interface JOESliderTests : XCTestCase
@property (strong, nonatomic) JOESlider *slider;
@end

@implementation JOESliderTests

- (void)setUp
{
    [super setUp];
    
    self.slider = [[JOESlider alloc] initWithFrame:CGRectZero];
}

- (void)testConfigureTargetActionsForEvents
{
    NSArray *valueChangedActions = [self.slider actionsForTarget:self.slider forControlEvent:UIControlEventValueChanged];
    XCTAssert([valueChangedActions count], @"No target actions were configured for UIControlEventChanged");
    
    NSArray *touchUpInsideActions = [self.slider actionsForTarget:self.slider forControlEvent:UIControlEventTouchUpInside];
    XCTAssert([touchUpInsideActions count], @"No target actions were configured for UIControlEventChanged");
}

@end
