//
//  JAPoper.h
//  JAPoper
//
//  Created by wallace on 2018/12/15.
//  Copyright © 2018年 wallace. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



@interface JAPoper : UIView


typedef NS_ENUM(NSUInteger, PopDirection) {
    PopDirectionLeft = 0, // 向左
    PopDirectionRight, // 向右
    PopDirectionUp, // 向上
    PopDirectionDown, // 向下
};
-(instancetype)initWithOrigin:(CGPoint)origin andView:(UIView*)popview andDirecttion:(PopDirection)diraction;

/**
 容器视图
 */
@property (nonatomic, strong) UIView *backView;

/**
 容器视图
 */
@property (nonatomic, strong) UIView *JAView;
/**
 弹出方向
 */
@property (nonatomic, assign) PopDirection popdiraction;

/**
 弹出视图
 */
-(void)popView;

/**
 隐藏视图
 */
-(void)dismiss;


@end

NS_ASSUME_NONNULL_END
