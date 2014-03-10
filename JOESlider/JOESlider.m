//
//  JOESlider.h
//
//  Version 0.1.0
//
//  Created by Joseph Collins on 1/25/14.
//
//  Distributed under The MIT License (MIT)
//  Get the latest version here:
//
//  http://www.github.com/ijoecollins/JOESlider
//
//  Copyright (c) 2014 Joseph Collins.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "JOESlider.h"

#pragma mark JOESlider Extension

typedef void(^EventHandler)(int value);

@interface JOESlider () {
@protected
    BOOL _animated;
    BOOL _animating;
}

@property (nonatomic, readwrite) BOOL animated;
@property (nonatomic, readwrite) BOOL animating;

@property (copy) EventHandler valueChanged;
@property (copy) EventHandler touchUp;

- (void)touchUp:(id)sender;
- (void)valueChanged:(id)sender;

@end


#pragma mark - JOESlider

@implementation JOESlider

#pragma mark - Creating a JOESlider

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self configureTargetActionsForEvents];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self configureTargetActionsForEvents];
    }
    return self;
}


- (void)configureTargetActionsForEvents
{
    [self addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
}


#pragma mark - Handle Events Using Blocks

- (void)touchUp:(id)sender
{
    if (self.touchUp) {
        self.touchUp(self.value);
    }
}


- (void)handletouchUp:(EventHandler)block
{
    self.touchUp = block;
}


- (void)valueChanged:(id)sender
{
    if (self.valueChanged) {
        self.valueChanged(self.value);
    }
}


-(void)handleValueChanged:(EventHandler)block
{
    self.valueChanged = block;
}

@end


#pragma mark -
#pragma mark - JOEStopSlider

@implementation JOEStopSlider

#pragma mark - Create a JOEStopSlider

- (instancetype)initWithStopComponents:(NSArray *)components andFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _animated = YES;
        _animating = NO;
        _stopComponents = components;
    }
    
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithStopComponents:@[@(0),@(.25),@(.5),@(.75),@(1)] andFrame:frame];
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        _animated = YES;
        _animating = NO;
        _stopComponents = @[@(0),@(.25),@(.5),@(.75),@(1)];
    }
    
    return self;
}


#pragma mark - Setters

- (void)setStopComponents:(NSArray *)stopComponents
{
    _stopComponents = stopComponents;
    
    self.minimumValue = [self.stopComponents[0] floatValue];
    self.maximumValue = [[self.stopComponents lastObject] floatValue];
}


#pragma mark - Handle Events Using Blocks

- (void)touchUp:(id)sender
{
    // We are using stops find the closest one and snap to it
    float distance = 38256;
    float location = 0;
    
    for (int i = 0; i < self.stopComponents.count; i++) {
        float contender = [self.stopComponents[i] floatValue];
        float currentValue = (self.value);
        float contenderDistance = fabs(contender - currentValue);
        if (distance > contenderDistance) {
            distance = contenderDistance;
            location = contender;
        } else {
            break; // Set a break to stop this nonsense. We have reached our destination.
        }
    }
    
    if (self.isAnimated) {
        self.animating = YES;
        [UIView animateWithDuration:1.0f delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:0.7 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            [self setValue:location animated:YES];
            [super valueChanged:sender];
        } completion:^(BOOL finished) {
            self.animating = NO;
            [super touchUp:sender];
        }];
    }else {
        self.value = location;
        [super valueChanged:sender];
        [super touchUp:sender];
    }
}

@end
