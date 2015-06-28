//
//  ViewController.m
//  侧面菜单
//
//  Created by 兜麦 on 15/6/28.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import "ViewController.h"
#import "LSCMainViewController.h"
#import "LSCMenuViewCOntroller.h"
#import "UIView+ExtensionFrame.h"
#define LSCMenuWidth 150
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.1初始化子控制器
    LSCMenuViewCOntroller *menu = [[LSCMenuViewCOntroller alloc] init];
    menu.view.width = LSCMenuWidth;
    [self.view addSubview:menu.view];
    [self addChildViewController:menu];
    
    
    // 1.2初始化子控制器
    LSCMainViewController *main = [[LSCMainViewController alloc] init];
    main.view.frame = self.view.bounds;
    [self.view addSubview:main.view];
    [self addChildViewController:main];
    
    // 2.监听手势
    [main.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragMainView:)]];
    
}

- (void)dragMainView:(UIPanGestureRecognizer *)pan
{
    CGPoint point = [pan translationInView:pan.view];
    
    // 结束拖拽
    if (pan.state == UIGestureRecognizerStateCancelled || pan.state == UIGestureRecognizerStateEnded)
    {
        if (pan.view.x >= LSCMenuWidth * 0.5)
        {
            [UIView animateWithDuration:0.2 animations:^{
                pan.view.transform = CGAffineTransformMakeTranslation(LSCMenuWidth, 0);
            }];
        }else
        {
            [UIView animateWithDuration:0.2 animations:^{
                pan.view.transform = CGAffineTransformIdentity;
            }];
        }
        
    }else
    {
        // 正在拖拽
        pan.view.transform = CGAffineTransformTranslate(pan.view.transform, point.x, 0);
        [pan setTranslation:CGPointZero inView:pan.view];
        
        if (pan.view.x >= LSCMenuWidth)
        {
            pan.view.transform =  CGAffineTransformMakeTranslation(LSCMenuWidth, 0);
        }else if (pan.view.x <= 0)
        {
            pan.view.transform = CGAffineTransformIdentity;
        }
    }
    
    
}


@end
