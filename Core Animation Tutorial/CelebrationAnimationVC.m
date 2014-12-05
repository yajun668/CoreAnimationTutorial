//
//  CelebrationAnimationVC.m
//  Core Animation Tutorial
//
//  Created by yajun on 12/4/14.
//  Copyright (c) 2014 Oklahoma state university. All rights reserved.
//
#import <QuartzCore/CoreAnimation.h>
#import "CelebrationAnimationVC.h"

@interface CelebrationAnimationVC ()
@property (strong,nonatomic) CALayer *myLayer;
@end

@implementation CelebrationAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //add background pic Christan tree
    self.myLayer = [[CALayer alloc]init];
    self.myLayer.frame=CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height-50);
    UIImage *image = [UIImage imageNamed:@"Chrismas.png"];
    self.myLayer.contents = (id)image.CGImage;
    [self.view.layer addSublayer:self.myLayer];
    
    // fireworks make the trees more beautiful
    CAEmitterLayer *myFireworks = [CAEmitterLayer layer];
    CGRect myBound = self.view.layer.bounds;
    myFireworks.emitterPosition = CGPointMake(myBound.size.width/2.0, myBound.size.height-50);
    myFireworks.emitterSize	= CGSizeMake(myBound.size.width/2.0, 0.0);
    myFireworks.emitterMode	= kCAEmitterLayerOutline;
    myFireworks.emitterShape	= kCAEmitterLayerLine;
    myFireworks.renderMode		= kCAEmitterLayerAdditive;
    myFireworks.seed = (arc4random()%100)+2;
    
    // build the emitter cell
    CAEmitterCell* circle = [CAEmitterCell emitterCell];
    circle.birthRate		= 5.0;
    circle.emissionRange	= 0.6 * M_PI;
    circle.velocity			= 360;
    circle.velocityRange	= 110;
    circle.yAcceleration	= 85;
    circle.lifetime			= 1.22;
    circle.contents			= (id) [[UIImage imageNamed:@"circle.png"] CGImage];
    circle.scale			= 0.2;
    circle.color			= [[UIColor redColor] CGColor];
    circle.greenRange		= 1.0;
    circle.redRange			= 1.0;
    circle.blueRange		= 1.0;
    circle.spinRange		= M_PI;
    
    // create burst so that it can spark
    CAEmitterCell* mySpark = [CAEmitterCell emitterCell];
    mySpark.birthRate = 1.7;
    mySpark.velocity = 0;
    mySpark.scale = 2.5;
    mySpark.redSpeed = -1.5;
    mySpark.blueSpeed =+1.5;
    mySpark.greenSpeed =+1.0;
    mySpark.lifetime = 0.35;
    // and finally, the sparks
    CAEmitterCell* finalSpark= [CAEmitterCell emitterCell];
    
    finalSpark.birthRate = 400;
    finalSpark.velocity	 = 125;
    finalSpark.emissionRange = 2* M_PI;
    finalSpark.yAcceleration = 75;
    finalSpark.lifetime	= 3;
    
    finalSpark.contents = (id) [[UIImage imageNamed:@"heartStar.png"] CGImage];
    finalSpark.scaleSpeed =-0.2;
    finalSpark.greenSpeed =-0.1;
    finalSpark.redSpeed	 = 0.4;
    finalSpark.blueSpeed =-0.1;
    finalSpark.alphaSpeed =-0.25;
    finalSpark.spin	= 2* M_PI;
    finalSpark.spinRange = 2* M_PI;
    // join it together
    myFireworks.emitterCells	= [NSArray arrayWithObject:circle];
    circle.emitterCells	= [NSArray arrayWithObject:mySpark];
    mySpark.emitterCells = [NSArray arrayWithObject:finalSpark];
    [self.view.layer addSublayer:myFireworks];

   
}

-(void)viewDidAppear:(BOOL)animated

{
    
}

-(void)viewDidDisappear:(BOOL)animated

{


}

- (void) viewWillUnload
{
    [self.myLayer removeFromSuperlayer];
    self.myLayer = nil;
}


- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapMeforGift:(UIButton *)sender {
    
    // create the gift layer
    CAEmitterLayer *giftLayer = [CAEmitterLayer layer];
    giftLayer.emitterPosition = CGPointMake(self.view.bounds.size.width / 2.0, -10);
    giftLayer.emitterSize = CGSizeMake(self.view.bounds.size.width * 2.0, 0.0);;
    giftLayer.emitterMode		= kCAEmitterLayerOutline;
    giftLayer.emitterShape	= kCAEmitterLayerLine;
    // create gift cell
    CAEmitterCell *gift = [CAEmitterCell emitterCell];
    gift.birthRate		= 0.45;
    gift.lifetime	= 18.0;
    gift.velocity		= -12;	// fall down direction
    gift.velocityRange = 10;
    gift.yAcceleration = 2;
    gift.emissionRange = 0.7 * M_PI;
     gift.contents		= (id) [[UIImage imageNamed:@"gift"] CGImage];
     giftLayer.shadowOpacity = 1.0;
     giftLayer.shadowRadius  = 0.0;
     giftLayer.shadowOffset  = CGSizeMake(0.0, 1.0);
     giftLayer.emitterCells = [NSArray arrayWithObject:gift];
    [self.view.layer addSublayer:giftLayer];
    
}

@end
