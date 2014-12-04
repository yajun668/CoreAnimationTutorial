//
//  SnowAniamtionVC.h
//  Core Animation Tutorial
//
//  Created by yajun on 12/4/14.
//  Copyright (c) 2014 Oklahoma state university. All rights reserved.
//

#import "ViewController.h"
@class CAEmitterLayer;

@interface SnowAniamtionVC : ViewController

@property (strong) CAEmitterLayer *fireEmitter;
@property (strong) CAEmitterLayer *smokeEmitter;

- (void) controlFireHeight:(id)sender;
- (void) setFireAmount:(float)zeroToOne;


@end
