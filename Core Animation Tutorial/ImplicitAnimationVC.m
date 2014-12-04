//
//  ImplicitAnimationVC.m
//  Core Animation Tutorial
//
//  Created by yajun on 12/3/14.
//  Copyright (c) 2014 Oklahoma state university. All rights reserved.
//

#import "ImplicitAnimationVC.h"

@interface ImplicitAnimationVC ()
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;
@property(strong,nonatomic) CALayer *myLayer;

- (IBAction)movePostion:(UIButton *)sender;
- (IBAction)changeOpacity:(UIButton *)sender;
- (IBAction)changeColor:(UIButton *)sender;
- (IBAction)changeSize:(UIButton *)sender;
- (IBAction)changeCorner:(UIButton *)sender;

@end

@implementation ImplicitAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.mySwitch setOn:YES];
    
    self.myLayer = [CALayer layer];
    [self.myLayer setBackgroundColor:[UIColor greenColor].CGColor];
    [self.myLayer setBounds:CGRectMake(0.0, 0.0, 180.0, 180.0)];
    CGPoint anchorPoint = {0.5, 0.5};
    [self.myLayer setAnchorPoint:anchorPoint];
    [self.myLayer setPosition:CGPointMake(160, 170)];
    [self.myLayer setOpacity:1.0f];
    [[[self view] layer] addSublayer:self.myLayer];
    
    
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

- (IBAction)movePostion:(UIButton *)sender {
    [CATransaction setDisableActions:![self.mySwitch isOn]];
    [CATransaction setAnimationDuration:5];
    CGPoint position1= CGPointMake(160, 170);
    CGPoint position2= CGPointMake(220, 170);
    self.myLayer.position = self.myLayer.position.x == 160 ? position2 : position1;
}

- (IBAction)changeOpacity:(UIButton *)sender {
    
    [CATransaction setDisableActions:![self.mySwitch isOn]];
    [CATransaction setAnimationDuration:3];
    self.myLayer.opacity = (self.myLayer.opacity == 1.0f) ? 0.3f : 1.0f;
 
}

- (IBAction)changeColor:(UIButton *)sender {
    [CATransaction setDisableActions:![self.mySwitch isOn]];
    [CATransaction setAnimationDuration:5];
    CGColorRef greenColor = [UIColor greenColor].CGColor;
    CGColorRef blueColor = [UIColor blueColor].CGColor;
    self.myLayer.backgroundColor = (self.myLayer.backgroundColor == greenColor) ? blueColor : greenColor;

}

- (IBAction)changeSize:(UIButton *)sender {
    
    [CATransaction setDisableActions:![self.mySwitch isOn]];
    [CATransaction setAnimationDuration:3];
    
    CGRect myBounds = self.myLayer.bounds;
    myBounds.size.width  = (myBounds.size.height == myBounds.size.width) ? 100 : 180.0;
    [self.myLayer setBounds:myBounds];
    
}

- (IBAction)changeCorner:(UIButton *)sender {
    
    [CATransaction setDisableActions:![self.mySwitch isOn]];
    [CATransaction setAnimationDuration:3];
    self.myLayer.cornerRadius = (self.myLayer.cornerRadius == 0.0f) ? 70.0f : 0.0f;
    
    
}
@end
