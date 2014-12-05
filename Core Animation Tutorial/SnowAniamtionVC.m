//
//  SnowAniamtionVC.m
//  Core Animation Tutorial
//
//  Created by yajun on 12/4/14.
//  Copyright (c) 2014 Oklahoma state university. All rights reserved.
//

#import "SnowAniamtionVC.h"
#import <QuartzCore/CoreAnimation.h>

@interface SnowAniamtionVC ()
@property (strong,nonatomic) CALayer *myLayer;
@end

@implementation SnowAniamtionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //add background pic Christan tree
    self.myLayer = [[CALayer alloc]init];
    self.myLayer.frame=CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height-50);
    UIImage *image = [UIImage imageNamed:@"snow.png"];
    self.myLayer.contents = (id)image.CGImage;
    [self.view.layer addSublayer:self.myLayer];
    
    // build the snow emitter
    CAEmitterLayer *mySnowLayer = [CAEmitterLayer layer];
    mySnowLayer.emitterPosition = CGPointMake(self.view.bounds.size.width / 2.0, -35);
    mySnowLayer.emitterSize		= CGSizeMake(self.view.bounds.size.width * 2.0, 0.0);;
    mySnowLayer.emitterMode		= kCAEmitterLayerOutline;
    mySnowLayer.emitterShape	= kCAEmitterLayerLine;
    
    // create snow cell
    
    CAEmitterCell *snowCell = [CAEmitterCell emitterCell];
    
    snowCell.birthRate		= 80.0;
    snowCell.lifetime		= 120.0;
    snowCell.velocity		= -10;				// falling down slowly
    snowCell.velocityRange = 10;
    snowCell.yAcceleration = 2;
    snowCell.emissionRange = 0.5 * M_PI;		// some variation in angle
    snowCell.spinRange		= 0.25 * M_PI;		// slow spin
    
    snowCell.contents		= (id) [[UIImage imageNamed:@"snowPoint.png"] CGImage];
    snowCell.color			= [[UIColor colorWithRed:0.600 green:0.658 blue:0.743 alpha:1.000] CGColor];
    
    // Make the flakes seem inset in the background
    mySnowLayer.shadowOpacity = 1.0;
    mySnowLayer.shadowRadius  = 0.0;
    mySnowLayer.shadowOffset  = CGSizeMake(0.0, 1.0);
    mySnowLayer.shadowColor   = [[UIColor whiteColor] CGColor];
    
    // Add everything to our backing layer below the UIContol defined in the storyboard
    mySnowLayer.emitterCells = [NSArray arrayWithObject: snowCell];
    [self.view.layer addSublayer:mySnowLayer];
    

}

- (void) viewWillUnload
{
    [super viewWillUnload];
    [self.myLayer removeFromSuperlayer];
    self.myLayer = nil;
}


- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIDeviceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
