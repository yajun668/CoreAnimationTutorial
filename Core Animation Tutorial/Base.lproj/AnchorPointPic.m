//
//  AnchorPointPic.m
//  Core Animation Tutorial
//
//  Created by yajun on 12/2/14.
//  Copyright (c) 2014 Oklahoma state university. All rights reserved.
//

#import "AnchorPointPic.h"

@implementation AnchorPointPic


- (id)init
{
    self = [super init];
    if (self) {
        [self setBounds:CGRectMake(0.0, 0.0, 20.0, 20.0)];
        [self setContentsScale:[[UIScreen mainScreen] scale]];
        
        [self setNeedsDisplay];
    }
    return self;
}

- (void)drawInContext:(CGContextRef)context
{
    CGRect bounds = [self bounds];
    CGPoint center = {CGRectGetMidX(bounds), CGRectGetMidY(bounds)};
    
    CGFloat strokeWidth = 2.0;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, NULL, center.x, center.y, bounds.size.width / 2 - strokeWidth, 0.0, (CGFloat) (M_PI * 2.0), 0);
    
    CGContextAddPath(context, path);
    CGContextSetFillColorWithColor(context, [[UIColor redColor] colorWithAlphaComponent:0.5].CGColor);
    CGContextFillPath(context);
    
    CGContextAddPath(context, path);
    CGContextSetLineWidth(context, strokeWidth);
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextStrokePath(context);
    
    CFRelease(path);
}

CGPoint getCalculateAnchorPointPosition(CALayer *superLayer)
{
    CGRect superLayerBounds = [superLayer bounds];
    CGPoint anchorPoint = [superLayer anchorPoint];
    return CGPointMake(superLayerBounds.size.width * anchorPoint.x, superLayerBounds.size.height * anchorPoint.y);
}

@end