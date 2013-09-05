//
//  SKCanvas.m
//  Pifagor
//
//  Created by Aleksandr Skorokhodov on 06.09.13.
//  Copyright (c) 2013 Aleksandr Skorokhodov. All rights reserved.
//

#import "SKCanvas.h"
#import "SKTreeItem.h"

@implementation SKCanvas

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
 CGContextRef ctx = UIGraphicsGetCurrentContext();
 CGContextClearRect(ctx, rect);
    CGPoint a = CGPointMake(100.0, 100.0);
    CGPoint b = CGPointMake(150.0, 100.0);
    SKTreeItem* pif = [SKTreeItem treeItemWithPointA: a PointB: b ];
    SKTreeItem* pif2 = [SKTreeItem treeItemWithPointA: pif.pointE PointB: pif.pointC ];
    SKTreeItem* pif3 = [SKTreeItem treeItemWithPointA: pif.pointD PointB: pif.pointE ];

    
 [[UIColor redColor] set];
 CGContextSetLineWidth(ctx, 2.0f);
 
// CGContextMoveToPoint(ctx, self.bounds.size.width/2,0.0f);

    CGContextMoveToPoint(ctx, pif.pointA.x, pif.pointA.y);
    CGContextAddLineToPoint(ctx, pif.pointB.x, pif.pointB.y);
    CGContextAddLineToPoint(ctx, pif.pointC.x, pif.pointC.y);
    CGContextAddLineToPoint(ctx, pif.pointE.x, pif.pointE.y);
    CGContextAddLineToPoint(ctx, pif.pointD.x, pif.pointD.y);
    CGContextAddLineToPoint(ctx, pif.pointA.x, pif.pointA.y);

    CGContextStrokePath(ctx);

    
    CGContextMoveToPoint(ctx, pif2.pointA.x, pif2.pointA.y);
    CGContextAddLineToPoint(ctx, pif2.pointB.x, pif2.pointB.y);
    CGContextAddLineToPoint(ctx, pif2.pointC.x, pif2.pointC.y);
    CGContextAddLineToPoint(ctx, pif2.pointE.x, pif2.pointE.y);
    CGContextAddLineToPoint(ctx, pif2.pointD.x, pif2.pointD.y);
    CGContextAddLineToPoint(ctx, pif2.pointA.x, pif2.pointA.y);

    CGContextStrokePath(ctx);

    CGContextMoveToPoint(ctx, pif3.pointA.x, pif3.pointA.y);
    CGContextAddLineToPoint(ctx, pif3.pointB.x, pif3.pointB.y);
    CGContextAddLineToPoint(ctx, pif3.pointC.x, pif3.pointC.y);
    CGContextAddLineToPoint(ctx, pif3.pointE.x, pif3.pointE.y);
    CGContextAddLineToPoint(ctx, pif3.pointD.x, pif3.pointD.y);
    CGContextAddLineToPoint(ctx, pif3.pointA.x, pif3.pointA.y);
    
    CGContextStrokePath(ctx);

    // Drawing code
}


@end
