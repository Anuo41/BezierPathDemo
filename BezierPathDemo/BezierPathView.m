//
//  BezierPathView.m
//  BezierPathDemo
//
//  Created by DerrickYoung41 on 2020/2/16.
//  Copyright © 2020 DerrickYoung41. All rights reserved.
//

#import "BezierPathView.h"

@implementation BezierPathView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    switch (self.type) {
        case BezierPathLineType:
            [self drawLine];
            break;
        case BezierPathPolygonType:
            [self drawPolygon];
            break;
        case BezierPathRectangleType:
            [self drawRectangle];
            break;
        case BezierPathCircleType:
            [self drawCircle];
        case BezierPathArcType:
            [self drawArc];
        case BezierPathQuadCurveType:
            [self drawQuadCurve];
        case BezierPathTripCurveType:
            [self drawTripCurve];
        case BezierPathCornerRectType:
            [self drawCornerRect];
        default:
            break;
    }
}

- (void)setType:(BezierPathType)type {
    _type = type;
    [self setNeedsDisplay];
    
    
}

//1.画直线
- (void)drawLine {
    UIColor *color = [UIColor blueColor];
    [color set];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(250, 100)];
    
    path.lineWidth = 3.0;
    path.lineCapStyle = kCGLineCapRound;    //线条拐角
    path.lineJoinStyle = kCGLineJoinRound;  //终点处理
    
    [path stroke];
}

//2.画多边形
- (void)drawPolygon {
    UIColor *color = [UIColor greenColor];
    [color set];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineJoinRound;
    path.lineJoinStyle = kCGLineJoinRound;
    
    [path moveToPoint:CGPointMake(200, 50)];
    [path addLineToPoint:CGPointMake(300, 100)];
    [path addLineToPoint:CGPointMake(260, 200)];
    [path addLineToPoint:CGPointMake(100.0, 200)];
    [path addLineToPoint:CGPointMake(100, 70)];
    [path closePath]; //最后一条线线通过调用closePath方法得到
    
    [path stroke];
    //[path fill];  fill会填充轨迹内的图形
}

//3.画矩形
- (void)drawRectangle {
    UIColor *color = [UIColor yellowColor];
    [color set];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 200, 200)];
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    
    [path stroke];
}

//4.画圆形
- (void)drawCircle {
    UIColor *color = [UIColor purpleColor];
    [color set];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 50, 200, 200) cornerRadius:100];    //画矩形范围内的内切圆
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    
    [path stroke];
}

//5.画弧线
- (void)drawArc {
    UIColor *color = [UIColor purpleColor];
    [color set];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:60 startAngle:0 endAngle:(M_PI * 2/3)  clockwise:YES];
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    
    [path stroke];
}

//6.画二次贝塞尔曲线
- (void)drawQuadCurve {
    UIColor *color = [UIColor redColor];
    [color set];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    /*
     - (void)addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint
     Parameters
     endPoint
     The end point of the curve.
     controlPoint
     The control point of the curve.    控制点，是起点和终点画出的圆的切线的交点
     */
    [path moveToPoint:CGPointMake(40, 150)];
    [path addQuadCurveToPoint:CGPointMake(150, 210) controlPoint:CGPointMake(60, 30)];
    [path stroke];
}

//7.绘制三次贝塞尔曲线
- (void)drawTripCurve {
    UIColor * color = [UIColor yellowColor];
    [color set];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    
    [path moveToPoint:CGPointMake(100, 200)];
    [path addCurveToPoint:CGPointMake(250, 210) controlPoint1:CGPointMake(100, 0) controlPoint2:CGPointMake(100, 160)];
    [path stroke];
}

//8.指定矩形的某个角为圆角
- (void)drawCornerRect {
    UIColor *color = [UIColor greenColor];
    [color set];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(150, 150, 200, 200) byRoundingCorners:UIRectCornerBottomLeft cornerRadii:CGSizeMake(30, 30)];
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    
    [path stroke];
}

@end
