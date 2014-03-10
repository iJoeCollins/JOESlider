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

#import <UIKit/UIKit.h>

#pragma mark JOESlider Interface

/*! JOESlider is a basic subclass of UISlider, used to select a value from a continuous range of values. This is a base class for further implementations such as JOEStopSlider and the like.
*/

@interface JOESlider : UISlider


///-------------------------------
/// @name Properties
///-------------------------------

/*! Boolean indicating whether the slider should be animated when its value programmatically changes
*/
@property (nonatomic, getter=isAnimated, readonly) BOOL animated;

/*! Boolean indicating whether the slider is currently animating its value
*/
@property (nonatomic, getter=isAnimating, readonly) BOOL animating;


///-------------------------------
/// @name Creating a JOESlider
///-------------------------------

/*! The designated initializer when using JOESlider in code.
 
    @param frame Used to size and position the control.
    @return      Returns a JOESlider object.
*/

- (instancetype)initWithFrame:(CGRect)frame;


///----------------------------------
/// @name Handle Events Using Blocks
///----------------------------------

/*! This is a block method that handles the value changed event. This will probably be called in the viewDidLoad method most of the time to configure the slider.
 
    @param block Code block which is passed in a slider value variable.
*/

- (void)handleValueChanged:(void (^) (int value))block;

/*! This is a block method that handles the touch up event. This will probably be called in the viewDidLoad method most of the time to configure the slider.
 
    @param block Code block which is passed in a slider value variable.
*/

- (void)handletouchUp:(void (^) (int value))block;

@end

#pragma mark - JOEStopSlider Interface

/*! JOEStopSlider is used to select a value from a set of values. When the gesture is finished the control's handle will snap to the nearest stop point value.
*/

@interface JOEStopSlider : JOESlider


///-------------------------------
/// @name Properties
///-------------------------------

/*! An array of numbers that act as set values for the sliders handle to come to rest.
*/
@property (strong, nonatomic) NSArray *stopComponents;


///--------------------------------
/// @name Creating a JOEStopSlider
///--------------------------------

/*! Designated initializer.
 
    @param components An NSArray of NSNumbers with int values.
    @param frame      CGRect position of the slider.
    @return           Returns a JOEStopSlider object
*/

- (instancetype)initWithStopComponents:(NSArray *)components andFrame:(CGRect)frame;

/*! Secondary initializer.
 
    @param frame Used to size and position the control.
    @return      Returns a JOEStopSlider object.
*/

- (instancetype)initWithFrame:(CGRect)frame;

@end
