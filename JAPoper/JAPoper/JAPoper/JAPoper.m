//
//  JAPoper.m
//  JAPoper
//
//  Created by wallace on 2018/12/15.
//  Copyright © 2018年 wallace. All rights reserved.
//

#import "JAPoper.h"
#import "UIView+Extension.h"


@implementation JAPoper

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)initWithOrigin:(CGPoint)origin andView:(UIView*)popview andDirecttion:(PopDirection)diraction
{
     UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    
    self = [super initWithFrame:keyWindow.bounds];
    //背景颜色为无色
    self.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
    self.JAView = popview;
    self.popdiraction = diraction;
    if(diraction == PopDirectionLeft )
    {
        self.backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, popview.frame.size.width*2, popview.frame.size.height)];
        popview.left = 0;
        popview.top = 0;
    }
    else if(diraction == PopDirectionRight)
    {
        self.backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, popview.frame.size.width*2, popview.frame.size.height)];
        popview.left = popview.width;
        popview.top = 0;
    }
    else if(diraction == PopDirectionUp)
    {
        self.backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, popview.frame.size.width, popview.frame.size.height*2)];
        popview.left = 0;
        popview.top =0;
    }
    else if(diraction == PopDirectionDown)
    {
        self.backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, popview.frame.size.width, popview.frame.size.height*2)];
        popview.left = 0;
        popview.top =  popview.height;
    }
    //定义显示视图的参数

    self.backView.backgroundColor=[UIColor clearColor];
    [self addSubview:self.backView];
    
    
    self.backView.center = origin;
    [self.backView addSubview:popview];
    
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if (![touch.view isEqual:self.JAView]) {
        [self dismiss];
    }
}

-(void)popView
{
    
    
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    [keyWindow addSubview:self];
    
    if(self.popdiraction == PopDirectionLeft || self.popdiraction == PopDirectionRight)
    {
        self.backView.transform = CGAffineTransformMakeScale(0.0, 1.0);
    }
    else
    {
        self.backView.transform = CGAffineTransformMakeScale(1.0, 0);
    }
    
    
    
    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:0 animations:^{
        self.backView.transform  = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
    
    
}

-(void)dismiss{
    [UIView animateWithDuration:0.2 animations:^{
        self.backView.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
        self.alpha = 0;
    } completion:^(BOOL finished) {
        
        if (finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                
                [view removeFromSuperview];
                
            }
            [self.backView removeFromSuperview];
            [self removeFromSuperview];
            
        }
    }];
    
    //    //动画效果淡出
    //    [UIView animateWithDuration:0.2 animations:^{
    //        self.alpha = 0;
    //        //self.backView.frame = CGRectMake(self.origin.x, self.origin.y, 0, 0);
    //    } completion:^(BOOL finished) {
    //        if (finished) {
    //            [self removeFromSuperview];
    //
    //        }
    //    }];
    //
    
    
}


@end
