//
//  AutoLayoutAnimationVC.m
//  Core Animation Tutorial
//
//  Created by Y.Lu on 12/4/14.
//  Copyright (c) 2014 Oklahoma state university. All rights reserved.
//

#import "AutoLayoutAnimationVC.h"

@interface AutoLayoutAnimationVC ()
{
    NSMutableArray *layers;
    UITouch *currentTouch;
    NSTimer *rotateTimer;
    NSUInteger rotateIndex;
    
    CGFloat radius;
    BOOL animationFlag;

}

@end

@implementation AutoLayoutAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.myLayer = [[CALayer alloc]init];
//    // myLayer.backgroundColor = [[UIColor whiteColor]CGColor];
//    self.myLayer.frame = CGRectMake(50, 110, 80, 80);
//    self.myLayer.cornerRadius = 2;
//    UIImage *image = [UIImage imageNamed:@"OSU-LOGO.png"];
//    self.myLayer.contents = (id)image.CGImage;
//    [self.view.layer addSublayer:self.myLayer];
    
    
    
    radius = 80.0;
    self.view.backgroundColor = [UIColor blackColor];
    layers = [[NSMutableArray alloc] init];
    NSUInteger count = 24;
    for (int i = 0; i < count; i++) {
        
        self.myLayer = [[CALayer alloc]init];
        // myLayer.backgroundColor = [[UIColor whiteColor]CGColor];
      //  self.myLayer.frame = CGRectMake(50, 110, 15, 15);
      //  self.myLayer.cornerRadius = 2;
      //  self.myLayer.backgroundColor = (__bridge CGColorRef)([UIColor colorWithWhite:(0.5 + 0.5 * ((float)i/count)) alpha:1.0]);

        UIImage *image = [UIImage imageNamed:@"OSU-logo.png"];
        self.myLayer.contents = (id)image.CGImage;
     
              self.myLayer.bounds = CGRectMake(0.0, 0.0, 15.0, 15.0);
        [layers addObject:self.myLayer];
       
    }
    [self.view setNeedsLayout];
    
   [self layoutSubviews];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
//    [currentTouch release];
//    [rotateTimer invalidate];
//    [rotateTimer release];
//    [layers release];
//    [super dealloc];
}




- (void)timerMethod:(NSTimer *)t
{
    if (animationFlag) {
        if ((radius += 5) > 100) {
            animationFlag = NO;
        }
    }
    else {
        if ((radius -= 5) < 60) {
            animationFlag = YES;
        }
    }
    
    if (++rotateIndex >= [layers count]) {
        rotateIndex = 0;
    }
    [self.view setNeedsLayout];
}

- (void)layoutSubviews
{
    if (currentTouch) {
        if (!rotateTimer) {
            rotateTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerMethod:) userInfo:nil repeats:YES];
                           
                                }
        
        CGPoint p = [currentTouch locationInView:self.view];
        NSUInteger index = rotateIndex;
        for (CALayer *aLayer in layers) {
            CGFloat r = M_PI * 2 * index / [layers count];
            CGFloat x = p.x + cos(r) * radius * -1;
            CGFloat y = p.y + sin(r) * radius * -1;
            aLayer.position = CGPointMake(x, y);
            index++;
        }
        return;
    }
    
    radius = 80.0;
    
    if (rotateTimer) {
        rotateIndex = 0;
        [rotateTimer invalidate];
      //  [rotateTimer release];
        rotateTimer = nil;
    }
    
    NSUInteger index = 0;
    NSUInteger itemsPerRow = 4;
    NSUInteger rows = (NSUInteger)ceilf((float)[layers count] / (float)itemsPerRow);
    if (!rows) {
        rows = 1;
    }
    for (CALayer *aLayer in layers) {
        NSUInteger indexInRow = index % itemsPerRow;
        NSUInteger row = index / itemsPerRow;
        aLayer.position = CGPointMake((indexInRow + 1) * (self.view.bounds.size.width / (itemsPerRow  + 1)) ,
                                      (row + 1) * (self.view.bounds.size.height / (rows +1)));
        if (![aLayer superlayer]) {
            [self.view.layer addSublayer:aLayer];
        }
        index++;
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //	NSLog(@"%s", __PRETTY_FUNCTION__);
    currentTouch = [[touches allObjects] lastObject];
    [self.view setNeedsLayout];
    NSLog(@"HELL");
    
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //	NSLog(@"%s", __PRETTY_FUNCTION__);
    currentTouch = [[touches allObjects] lastObject];
    [self.view setNeedsLayout];
     NSLog(@"HELL move");
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //	NSLog(@"%s", __PRETTY_FUNCTION__);
    currentTouch = nil;
    [self.view setNeedsLayout];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    currentTouch = nil;
    [self.view setNeedsLayout];
   // NSLog(@"%s", __PRETTY_FUNCTION__);
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
