//
//  SimpleVC.m
//  Core Animation Tutorial
//
//  Created by yajun on 12/2/14.
//  Copyright (c) 2014 Oklahoma state university. All rights reserved.
//

#import "SimpleVC.h"

@interface SimpleVC ()
@property (strong,nonatomic) CALayer *myLayer;
@property (strong,nonatomic) CALayer *myScaleLayer;
@property (strong,nonatomic) CALayer *myMoveLayer;
@property (strong,nonatomic) CALayer *myCombineLayer;
@end

@implementation SimpleVC

- (void)viewDidLoad {
    [super viewDidLoad];


}

- (void)viewDidAppear:(BOOL)animated
{

    [self myRotate];
    [self myScale];
    [self myMove];
    [self myCombine];

    
}

- (void)viewWillDisappear:(BOOL)animated {

    [self.myLayer removeFromSuperlayer];
    [self.myScaleLayer removeFromSuperlayer];
    [self.myMoveLayer removeFromSuperlayer];
    [self.myCombineLayer removeFromSuperlayer];
    self.myLayer = nil;
    self.myScaleLayer = nil;
    self.myMoveLayer = nil;
    self.myCombineLayer = nil;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)myRotate
{
    
    self.myLayer = [[CALayer alloc]init];
   // myLayer.backgroundColor = [[UIColor whiteColor]CGColor];
    self.myLayer.frame = CGRectMake(50, 110, 80, 80);
    self.myLayer.cornerRadius = 2;
    UIImage *image = [UIImage imageNamed:@"OSU-LOGO.png"];
    self.myLayer.contents = (id)image.CGImage;
    [self.view.layer addSublayer:self.myLayer];
    // Rotate over Z axis
    CABasicAnimation *myRotateAnimation  = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    myRotateAnimation .fromValue = [NSNumber numberWithFloat:0.0];
    myRotateAnimation .toValue = [NSNumber numberWithFloat:2.0 * M_PI];
    myRotateAnimation .duration = 5;
    myRotateAnimation .repeatCount = NSNotFound;
    [self.myLayer addAnimation:myRotateAnimation  forKey:@"myRotate"];
    
}


- (void)myScale

{
    self.myScaleLayer = [CALayer layer];
    self.myScaleLayer.frame = CGRectMake(190, 110, 80, 80);
    self.myScaleLayer.cornerRadius = 2;
    UIImage *image = [UIImage imageNamed:@"OSU-LOGO.png"];
    self.myScaleLayer.contents = (id)image.CGImage;
    [self.view.layer addSublayer:self.myScaleLayer];
 
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.duration = 3;
    scaleAnimation.autoreverses = YES;
    scaleAnimation.repeatCount = NSNotFound;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.myScaleLayer addAnimation:scaleAnimation forKey:@"myScale"];
}




- (void)myMove
{
    
    self.myMoveLayer = [[CALayer alloc]init];
    self.myMoveLayer.frame = CGRectMake(50, 255, 80, 80);
    UIImage *image = [UIImage imageNamed:@"OSU-LOGO.png"];
    self.myMoveLayer.contents = (id)image.CGImage;
    self.myMoveLayer.cornerRadius = 2;
    [self.view.layer addSublayer:self.myMoveLayer];
    // move Animation
    CABasicAnimation *animation  = [CABasicAnimation animationWithKeyPath:@"position"];
    CGPoint fromPoint = self.myMoveLayer.position;
    fromPoint.x-=50;
    fromPoint.y-=40;
    animation.fromValue = [NSValue valueWithCGPoint:fromPoint];
    CGPoint toPoint = self.myMoveLayer.position;
    toPoint.x += 180;
    toPoint.y += 40;
    animation.toValue = [NSValue valueWithCGPoint:toPoint];
    animation.autoreverses = YES;
    animation.duration = 3;
    animation.repeatCount = NSNotFound;
    [self.myMoveLayer addAnimation:animation forKey:@"myMove"];
    
}


- (void)myCombine{
    
    self.myCombineLayer = [CALayer layer];
    self.myCombineLayer.frame = CGRectMake(50, 420, 80, 80);
    self.myCombineLayer.cornerRadius = 2;
    UIImage *image = [UIImage imageNamed:@"OSU-LOGO.png"];
    self.myCombineLayer.contents = (id)image.CGImage;
    [self.view.layer addSublayer:self.myCombineLayer];
    
    // move position
    CABasicAnimation *moveAnimation  = [CABasicAnimation animationWithKeyPath:@"position"];
    CGPoint fromPoint = self.myCombineLayer.position;
    fromPoint.x-=80;
    fromPoint.y-=10;
    moveAnimation.fromValue = [NSValue valueWithCGPoint:fromPoint];
    CGPoint toPoint = self.myCombineLayer.position;
    toPoint.x += 110;
    toPoint.y += 10;
    moveAnimation.toValue = [NSValue valueWithCGPoint:toPoint];
    moveAnimation.autoreverses = YES;
    moveAnimation.duration = 2;
    moveAnimation.repeatCount = NSNotFound;
    // Rotate animation
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:8 * M_PI];
    rotationAnimation.duration = 2;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    // scale animation
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.5];
    scaleAnimation.duration = 2;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    // combine all animations
    CAAnimationGroup *animationCombine = [CAAnimationGroup animation];
    animationCombine.duration = 2;
    animationCombine.autoreverses = YES;
    animationCombine.repeatCount = NSNotFound;
    [animationCombine setAnimations:[NSArray arrayWithObjects:rotationAnimation, scaleAnimation,moveAnimation, nil]];
    [self.myCombineLayer addAnimation:animationCombine forKey:@"animationCombine"];
}


@end
