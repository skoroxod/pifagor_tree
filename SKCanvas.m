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
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextClearRect(ctx, rect);
    CGPoint a = CGPointMake( -self.bounds.size.width/12, 0.0);
    CGPoint b = CGPointMake( self.bounds.size.width/12, 0.0);
    SKTreeItem* pifagorTree = [SKTreeItem treeItemWithPointA: a PointB: b ];

    CGContextSetRGBFillColor(ctx, 0.0f, 1.0f, 1.0f, 0.5f);
    CGContextSetRGBStrokeColor(ctx, 1.0f, 1.0f, 0.0f, 0.5f);
    CGContextRotateCTM(ctx, M_PI);
    CGContextTranslateCTM(ctx, -self.bounds.size.width/2, -self.bounds.size.height + 1);

    CGContextSetLineWidth(ctx, 1.0f);
    [pifagorTree drawTreeWithCtx:ctx withMinBaseLength: 2.0f];

}


@end
