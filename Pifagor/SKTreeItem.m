//
//  SKTreeItem.m
//  Pifagor
//
//  Created by Aleksandr Skorokhodov on 06.09.13.
//  Copyright (c) 2013 Aleksandr Skorokhodov. All rights reserved.
//

#import "SKTreeItem.h"

@implementation SKTreeItem

@synthesize pointA, pointB, pointC, pointD, pointE;


+ (id)treeItemWithPointA:(CGPoint) _pointA PointB:(CGPoint) _pointB {
	return [[SKTreeItem alloc] initWithPointA: _pointA PointB: _pointB];
}


- (id)initWithPointA:(CGPoint) _pointA PointB:(CGPoint) _pointB {
	self = [super init];
	if (self != nil) {
		self.pointA = _pointA;
		self.pointB = _pointB;
        [self calculatePoints];
	}
	return self;
}


- (id)init {
	self = [super init];
	if (self != nil) {
		self.pointA = CGPointMake(0.0, 0.0);
		self.pointB = CGPointMake(10.0, 0.0);
        [self calculatePoints];
	}
	return self;
}

- (void) calculatePoints {
    pointC = CGPointMake( pointB.x - pointB.y + pointA.y, 
                              pointB.y + pointB.x - pointA.x);
    pointD = CGPointMake( pointA.x - pointB.y + pointA.y ,
                         pointA.y + pointB.x - pointA.x);
    pointE = CGPointMake( pointC.x + (pointD.x-pointC.x + pointA.y - pointB.y)/2 ,
                         pointC.y + (pointD.y - pointC.y + pointB.x -pointA.x)/2 );
    
    
}

// возвращает длину основания
- (float) baseLength {
    return sqrtf(pow(fabs(pointA.x - pointB.x),2) + pow( fabs(pointA.y - pointB.y), 2));
    
}

- (void) drawTreeWithCtx:(CGContextRef) ctx withMinBaseLength:(float) _length {
    SKTreeItem* left = [SKTreeItem treeItemWithPointA: pointE PointB: pointC ];
    SKTreeItem* right = [SKTreeItem treeItemWithPointA: pointD PointB: pointE ];
    [self drawItemWithCtx:ctx];
    if ([self baseLength] > _length) {
        [left drawTreeWithCtx:ctx withMinBaseLength: _length ];
        [right drawTreeWithCtx:ctx withMinBaseLength: _length ];
    }
}

- (void) drawItemWithCtx:(CGContextRef) ctx {

    CGContextMoveToPoint(ctx, pointA.x, pointA.y);
    CGContextAddLineToPoint(ctx, pointB.x, pointB.y);
    CGContextAddLineToPoint(ctx, pointC.x, pointC.y);
    CGContextAddLineToPoint(ctx, pointD.x, pointD.y);
    CGContextFillPath(ctx);

    CGContextMoveToPoint(ctx, pointA.x, pointA.y);
    CGContextAddLineToPoint(ctx, pointB.x, pointB.y);
    CGContextAddLineToPoint(ctx, pointC.x, pointC.y);
    CGContextAddLineToPoint(ctx, pointD.x, pointD.y);
    CGContextAddLineToPoint(ctx, pointE.x, pointE.y);
    CGContextAddLineToPoint(ctx, pointC.x, pointC.y);
    CGContextAddLineToPoint(ctx, pointD.x, pointD.y);
    CGContextAddLineToPoint(ctx, pointA.x, pointA.y);
    
    CGContextStrokePath(ctx);

}

@end
