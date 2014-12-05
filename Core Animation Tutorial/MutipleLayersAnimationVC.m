//  MutipleLayersAnimationVC.m
//  Core Animation Tutorial
//  Created by Y.Lu on 12/4/14.
//  Copyright (c) 2014 Oklahoma state university. All rights reserved.
//

#import "MutipleLayersAnimationVC.h"
@interface MutipleLayersAnimationVC ()

{
    CALayer *myLayer;

}

@end

@implementation MutipleLayersAnimationVC

-(void)viewDidAppear:(BOOL)animated

{

    myLayer = [CALayer layer];
    myLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:myLayer];
    
    
    // layer1 for p3 pic
    
    CALayer *layer1 = [CALayer layer];
    UIImage *myImage1 = [UIImage imageNamed:@"p3.jpg"];
    layer1.contents = (id)myImage1.CGImage;
    layer1.bounds = CGRectMake(0, 0, 200, 200);
    layer1.position = CGPointMake(110, 270);
    layer1.opacity = 0.65;
    layer1.cornerRadius = 10;
    layer1.borderColor = [UIColor whiteColor].CGColor;
    layer1.shadowOpacity = 0.35;
    layer1.shadowColor = [UIColor darkGrayColor].CGColor;
    layer1.shouldRasterize = YES;
    [myLayer addSublayer:layer1];
    
    // layer2 for p7 pic
    
    CALayer *layer2 = [CALayer layer];
    UIImage *myImage2 = [UIImage imageNamed:@"p7.jpg"];
    layer2.contents = (id)myImage2.CGImage;
    layer2.bounds = CGRectMake(0, 0, 200, 200);
    layer2.position = CGPointMake(110, 270);
    layer2.opacity = 0.65;
    layer2.cornerRadius = 10;
    layer2.borderColor = [UIColor whiteColor].CGColor;
    layer2.shadowOpacity = 0.35;
    layer2.shadowColor = [UIColor darkGrayColor].CGColor;
    layer2.shouldRasterize = YES;
    [myLayer addSublayer:layer2];
    
    // layer3 for p8 pic
    
    CALayer *layer3 = [CALayer layer];
    UIImage *myImage3 = [UIImage imageNamed:@"p8.jpg"];
    layer3.contents = (id)myImage3.CGImage;
    layer3.bounds = CGRectMake(0, 0, 200, 200);
    layer3.position = CGPointMake(110, 270);
    layer3.opacity = 0.65;
    layer3.cornerRadius = 10;
    layer3.borderColor = [UIColor whiteColor].CGColor;
    layer3.shadowOpacity = 0.35;
    layer3.shadowColor = [UIColor darkGrayColor].CGColor;
    layer3.shouldRasterize = YES;
    [myLayer addSublayer:layer3];
    
    // layer4 for guess pic
    
    CALayer *layer4 = [CALayer layer];
    UIImage *myImage4 = [UIImage imageNamed:@"guess.jpg"];
    layer4.contents = (id)myImage4.CGImage;
    layer4.bounds = CGRectMake(0, 0, 200, 200);
    layer4.position = CGPointMake(110, 270);
    layer4.opacity = 1;
    layer4.cornerRadius = 10;
    layer4.borderColor = [UIColor whiteColor].CGColor;
    layer4.shadowOpacity = 1;
    layer4.shadowColor = [UIColor darkGrayColor].CGColor;
    layer4.shouldRasterize = YES;
    [myLayer addSublayer:layer4];
    
    
    // Create basic animation to rotate around the Y and Z axes
    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    transformAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0.5*M_PI, 1, 1, 1)];
    transformAnimation.duration = 3.5;
    transformAnimation.autoreverses = YES;
    transformAnimation.repeatCount = HUGE_VALF;
    transformAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    int dist = 0;
    for (CALayer *layer in [myLayer sublayers]) {
        [layer addAnimation:transformAnimation forKey:nil];
        
        // Create animation to translate along the X axis
        CABasicAnimation *translateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
        translateAnimation.fromValue = [NSValue valueWithCATransform3D:layer.transform];
        translateAnimation.toValue = [NSNumber numberWithFloat:dist];
        translateAnimation.duration = 3.5;
        translateAnimation.autoreverses = YES;
        translateAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        translateAnimation.repeatCount = HUGE_VALF;
        [layer addAnimation:translateAnimation forKey:nil];
        dist += 55;
    }
    
    [self.view.layer addSublayer:myLayer];

}


-(void)viewDidDisappear:(BOOL)animated{

    [myLayer removeFromSuperlayer];
       myLayer = nil;


}


- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
