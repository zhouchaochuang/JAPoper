//
//  ViewController.m
//  JAPoper
//
//  Created by wallace on 2018/12/15.
//  Copyright © 2018年 wallace. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Extension.h"
#import "JAPoper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"JAPoper";
    
    UIButton *buttonDown = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    [buttonDown setTitle:@"向下" forState:UIControlStateNormal];
    [buttonDown setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    buttonDown.centerX = self.view.centerX;
    buttonDown.top = 64;
    [buttonDown addTarget:self action:@selector(PopDown) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonDown];
    
    
    UIButton *buttonright = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    [buttonright setTitle:@"向右" forState:UIControlStateNormal];
    [buttonright setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    buttonright.centerY = self.view.centerY;
    buttonright.left = 0;
    [buttonright addTarget:self action:@selector(PopRight) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonright];
    
    UIButton *buttonUp = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    [buttonUp setTitle:@"向上" forState:UIControlStateNormal];
    [buttonUp setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    buttonUp.centerX = self.view.centerX;
    buttonUp.bottom = self.view.height;
    [buttonUp addTarget:self action:@selector(PopUp) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonUp];
    
    UIButton *buttonleft = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    [buttonleft setTitle:@"向左" forState:UIControlStateNormal];
    [buttonleft setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    buttonleft.centerY = self.view.centerY;
    buttonleft.right = self.view.width;
    [buttonleft addTarget:self action:@selector(PopLeft) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonleft];
    
}


-(void)PopDown
{
    UIView *redview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 200)];
    redview.backgroundColor = [UIColor redColor];
    
    JAPoper *poper = [[JAPoper alloc] initWithOrigin:CGPointMake(self.view.centerX, 90) andView:redview andDirecttion:PopDirectionDown ];
    
    [poper popView];
}


-(void)PopRight
{
    UIView *redview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    redview.backgroundColor = [UIColor redColor];
    
    JAPoper *poper = [[JAPoper alloc] initWithOrigin:CGPointMake(60, self.view.centerY) andView:redview andDirecttion:PopDirectionRight];
    
    [poper popView];
}

-(void)PopLeft
{
    UIView *redview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    redview.backgroundColor = [UIColor redColor];
    
    JAPoper *poper = [[JAPoper alloc] initWithOrigin:CGPointMake(self.view.width - 60, self.view.centerY) andView:redview andDirecttion:PopDirectionLeft];
    
    [poper popView];
}


-(void)PopUp
{
    UIView *redview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 200)];
    redview.backgroundColor = [UIColor redColor];
    
    JAPoper *poper = [[JAPoper alloc] initWithOrigin:CGPointMake(self.view.centerX, self.view.height - 30) andView:redview andDirecttion:PopDirectionUp];
    
    [poper popView];
}


@end
