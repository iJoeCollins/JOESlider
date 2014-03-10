//
//  ViewController.h
//  JOESlider
//
//  Created by Joseph Collins on 3/10/14.
//  Copyright (c) 2014 Joseph Collins. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JOESlider;
@class JOEStopSlider;

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet JOESlider *slider;
@property (weak, nonatomic) IBOutlet JOEStopSlider *stopSlider;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@end
