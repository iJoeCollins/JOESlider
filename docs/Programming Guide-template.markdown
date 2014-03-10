JOESlider Programming Guide
===================================
Configure the slider using one of the included block methods. Most of the time
you will probably want to use handleValueChanged:

Basic examples below.

JCSlider Configuration
----------------------

```objc
- (void)configureSlider
{
    ViewController *__weak weakSelf = self;
    
    [self.slider handleValueChanged:^ (int value) {
        
        ViewController *strongSelf = weakSelf;
        
        strongSelf.valueLabel.text = [NSString stringWithFormat:@"%d", value];
    }];
}
```

JCStopSlider Configuration w/ Stop Components
---------------------------------------------

```objc
- (void)configureStopSlider
{
    self.stopSlider.stopComponents = @[@(0), @(20), @(40), @(60)];
    
     ViewController *__weak weakSelf = self;
    
    [self.stopSlider handleValueChanged:^(int value) {
        
        ViewController *strongSelf = weakSelf;
        
        strongSelf.valueLabel.text = [NSString stringWithFormat:@"%d", value];
    }];
}
```