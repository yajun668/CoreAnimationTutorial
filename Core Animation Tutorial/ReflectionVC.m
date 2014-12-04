//
//  ReflectionVC.m
//  Core Animation Tutorial
//
//  Created by yajun on 12/3/14.
//  Copyright (c) 2014 Oklahoma state university. All rights reserved.
//

#import "ReflectionVC.h"

@interface ReflectionVC ()

@end

@implementation ReflectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *myImage = [UIImage imageNamed:@"Great Wall.png"];
    // add layer whose content is a picture
    CALayer *myLayer = [CALayer layer];
    myLayer.contents = (id)myImage.CGImage;
    myLayer.bounds = CGRectMake(0, 0, myImage.size.width, myImage.size.height);
    myLayer.position = CGPointMake(160, 180);
    myLayer.borderColor = [UIColor redColor].CGColor;
    myLayer.borderWidth = 1.0;
    [self.view.layer addSublayer:myLayer];
    
    // add reflection layer
    CALayer *myReflectLayer = [CALayer layer];
    myReflectLayer.contents = myLayer.contents;
    myReflectLayer.bounds = myLayer.bounds;
    myReflectLayer.position = CGPointMake(160, 371);
    myReflectLayer.borderColor = myLayer.borderColor;
    myReflectLayer.borderWidth = myLayer.borderWidth;
    myReflectLayer.opacity = 0.6;
    
    [myReflectLayer setValue:[NSNumber numberWithFloat:M_PI] forKeyPath:@"transform.rotation.x"];
    
    // add Gradient Layer as mask
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.bounds = myReflectLayer.bounds;
    gradientLayer.position = CGPointMake(myReflectLayer.bounds.size.width / 2, myReflectLayer.bounds.size.height * 0.65);
    gradientLayer.colors = [NSArray arrayWithObjects:(id)[[UIColor clearColor] CGColor],(id)[[UIColor whiteColor] CGColor], nil];
    gradientLayer.startPoint = CGPointMake(0.5, 0.0);
    gradientLayer.endPoint = CGPointMake(0.5, 1.5);
    myReflectLayer.mask = gradientLayer;
    [self.view.layer addSublayer:myReflectLayer];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
