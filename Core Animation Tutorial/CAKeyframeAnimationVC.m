//
//  CAKeyframeAnimationVC.m
//  Core Animation Tutorial
//
//  Created by yajun on 12/3/14.
//  Copyright (c) 2014 Oklahoma state university. All rights reserved.
//

#import "CAKeyframeAnimationVC.h"
#import <QuartzCore/QuartzCore.h>

@interface CAKeyframeAnimationVC ()
{
    CGMutablePathRef path;
}

@end

@implementation CAKeyframeAnimationVC



- (void)viewDidAppear:(BOOL)animated
{

    self.view.backgroundColor = [UIColor redColor];
    
    // Create a arbitrary path
    path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 30.0, 120.0);
    for (NSUInteger i = 0; i < 8; i++) {
        CGFloat x = (i % 2) ? 30.0 : self.view.bounds.size.width - 120.0;
        CGFloat y = 110.0 + 35.0 * (i + 1);
        CGPathAddArcToPoint(path, NULL, x, y, x, y + 15.0, 10.0);
    }
    
    CGPathAddLineToPoint(path, NULL, 30, 410);
    CGPathAddArc(path, NULL, 30, 410, 60, 0, 0.5* M_PI, NO);
    CGPathAddLineToPoint(path, NULL, 30, 490);
    CGPathAddLineToPoint(path, NULL, 290, 490);
    CGPathAddArc(path, NULL, self.view.center.x+100, self.view.center.y, 30, 0, 1* M_PI, NO);
    CGPathAddLineToPoint(path, NULL, 250, 120);
    CGPathAddLineToPoint(path, NULL, 30.0, 120.0);
    
    // add road layer for travel
    
    CAShapeLayer *myRoad = [CAShapeLayer layer];
    myRoad.path = path;
    myRoad.strokeColor = [UIColor blackColor].CGColor;
    myRoad.fillColor = [UIColor clearColor].CGColor;
    myRoad.lineWidth = 10;
    [self.view.layer addSublayer:myRoad];
    
    // add center layer for travel
    
    CAShapeLayer *mycenter = [CAShapeLayer layer];
    mycenter.path = path;
    mycenter.strokeColor = [UIColor blueColor].CGColor;
    mycenter.fillColor = [UIColor clearColor].CGColor;
    mycenter.lineWidth = 2.0;
    mycenter.lineDashPattern = [NSArray arrayWithObjects:[NSNumber numberWithInt:5], [NSNumber numberWithInt:3], nil];
    [self.view.layer addSublayer:mycenter];
    
    
    CALayer *moterCycle = [CALayer layer];
    moterCycle.bounds = CGRectMake(0, 0, 40.0, 20.0);
    moterCycle.position = CGPointMake(60, 25);
    moterCycle.contents = (id)([UIImage imageNamed:@"Motorcycle.png"].CGImage);
    [self.view.layer addSublayer:moterCycle];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    anim.path = path;
    anim.rotationMode = kCAAnimationRotateAuto;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.repeatCount = HUGE_VALF;
    anim.duration = 15;
    [moterCycle addAnimation:anim forKey:@"race"];
    
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
