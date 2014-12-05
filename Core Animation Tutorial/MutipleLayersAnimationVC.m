//  MutipleLayersAnimationVC.m
//  Core Animation Tutorial
//
//  Created by Y.Lu on 12/4/14.
//  Copyright (c) 2014 Oklahoma state university. All rights reserved.
//

#import "MutipleLayersAnimationVC.h"

@interface MutipleLayersAnimationVC ()

{CALayer *rootLayer;}

@end

@implementation MutipleLayersAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    rootLayer = [CALayer layer];
    // Apply perspective transform
  //  rootLayer.sublayerTransform = CATransform3DMakePerspective(1000);
    rootLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:rootLayer];
    
    NSArray *colors = [NSArray arrayWithObjects:[UIColor redColor], [UIColor greenColor], [UIColor purpleColor], nil];
    [self addLayersWithColors:colors];
    
    [self performSelector:@selector(rotateLayers) withObject:nil afterDelay:1.0];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)addLayersWithColors:(NSArray *)colors {
    
    for (UIColor *color in colors) {
        CALayer *layer = [CALayer layer];
        layer.backgroundColor = color.CGColor;
        layer.bounds = CGRectMake(0, 0, 200, 200);
        layer.position = CGPointMake(160, 170);
        layer.opacity = 0.65;
        layer.cornerRadius = 10;
        layer.borderColor = [UIColor whiteColor].CGColor;
        layer.borderWidth = 1.0;
        layer.shadowOffset = CGSizeMake(0, 2);
        layer.shadowOpacity = 0.35;
        layer.shadowColor = [UIColor darkGrayColor].CGColor;
        layer.shouldRasterize = YES;
        [rootLayer addSublayer:layer];
    }
}

- (void)rotateLayers {
    
    // Create basic animation to rotate around the Y and Z axes
    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    transformAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0.5*M_PI, 0, 1, 1)];
    transformAnimation.duration = 1.5;
    transformAnimation.autoreverses = YES;
    transformAnimation.repeatCount = HUGE_VALF;
    transformAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    int tx = 0;
    // Loop through the sublayers and attach the animations
    for (CALayer *layer in [rootLayer sublayers]) {
        [layer addAnimation:transformAnimation forKey:nil];
        
        // Create animation to translate along the X axis
        CABasicAnimation *translateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
        translateAnimation.fromValue = [NSValue valueWithCATransform3D:layer.transform];
        translateAnimation.toValue = [NSNumber numberWithFloat:tx];
        translateAnimation.duration = 1.5;
        translateAnimation.autoreverses = YES;
        translateAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        translateAnimation.repeatCount = HUGE_VALF;
        [layer addAnimation:translateAnimation forKey:nil];
        tx += 35;
    }
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
