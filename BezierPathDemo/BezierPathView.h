//
//  BezierPathView.h
//  BezierPathDemo
//
//  Created by DerrickYoung41 on 2020/2/16.
//  Copyright © 2020 DerrickYoung41. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BezierPathType) {
    BezierPathLineType = 0,
    BezierPathPolygonType = 1,
    BezierPathRectangleType = 2,
    BezierPathCircleType = 3,
    BezierPathArcType = 4,
    BezierPathQuadCurveType = 5,
    BezierPathTripCurveType = 6,
    BezierPathCornerRectType = 7,
};

@interface BezierPathView : UIView

@property (nonatomic, assign) BezierPathType type;


@end

