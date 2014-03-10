//
//  ViewController.m
//  JOESlider
//
//  Created by Joseph Collins on 3/10/14.
//  Copyright (c) 2014 Joseph Collins. All rights reserved.
//

#import "ViewController.h"
#import "JOESlider.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureSlider];
    [self configureStopSlider];
}

- (void)configureSlider
{
    ViewController *__weak weakSelf = self;
    
    [self.slider handleValueChanged:^ (int value) {
        
        ViewController *strongSelf = weakSelf;
        
        strongSelf.valueLabel.text = [NSString stringWithFormat:@"%d", value];
    }];
}

- (void)configureStopSlider
{
    self.stopSlider.stopComponents = @[@(0), @(20), @(40), @(60)];
    
    ViewController *__weak weakSelf = self;
    
    [self.stopSlider handleValueChanged:^(int value) {
        
        ViewController *strongSelf = weakSelf;
        
        strongSelf.valueLabel.text = [NSString stringWithFormat:@"%d", value];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

