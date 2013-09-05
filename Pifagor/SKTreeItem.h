//
//  SKTreeItem.h
//  Pifagor
//
//  Created by Aleksandr Skorokhodov on 06.09.13.
//  Copyright (c) 2013 Aleksandr Skorokhodov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKTreeItem : NSObject


/*
 точки на фигуре расположены так
 
       E
 
   D      C
 
 
   A      B 
 */

@property CGPoint pointA;
@property CGPoint pointB;
@property CGPoint pointC;
@property CGPoint pointD;
@property CGPoint pointE;

+ (id)treeItemWithPointA:(CGPoint) _pointA PointB:(CGPoint) _pointB;

- (id)initWithPointA:(CGPoint) _pointA PointB:(CGPoint) _pointB;
- (id)init;

@end
