//
//  ViewController.m
//  BezierPathDemo
//
//  Created by DerrickYoung41 on 2020/2/16.
//  Copyright © 2020 DerrickYoung41. All rights reserved.
//

#import "ViewController.h"
#import "BezierPathView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIWindow *keyWindow = [[UIApplication sharedApplication].windows objectAtIndex:0];
    
    BezierPathView *testView = [[BezierPathView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(keyWindow.windowScene.statusBarManager.statusBarFrame), CGRectGetWidth(keyWindow.frame), CGRectGetHeight(keyWindow.frame))];
    //testView.type = BezierPathLineType;
    //testView.type = BezierPathPolygonType;
    //testView.type = BezierPathRectangleType;
    //testView.type = BezierPathCircleType;
    //testView.type = BezierPathArcType;
    //testView.type = BezierPathQuadCurveType;
    //testView.type = BezierPathTripCurveType;
    testView.type = BezierPathCornerRectType;
    [self.view addSubview:testView];
}


@end
