//
//  UIView+Addition.m
//  Addition
//
//  Created by 蔡成汉 on 15/11/20.
//  Copyright © 2015年 蔡成汉. All rights reserved.
//

#import "UIView+Addition.h"
#import <objc/runtime.h>

static char TapCallBackKey;

@interface UIView ()

@property (nonatomic , copy) void(^tapCallBack)(UITapGestureRecognizer *recognizer);

@end

@implementation UIView (Addition)

-(CGFloat)top {
    return self.frame.origin.y;
}

-(void)setTop:(CGFloat)top {
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

-(CGFloat)left {
    return self.frame.origin.x;
}

-(void)setLeft:(CGFloat)left {
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

-(CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

-(void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

-(CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

-(void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

-(CGFloat)width {
    return self.frame.size.width;
}

-(void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(CGFloat)height {
    return self.frame.size.height;
}

-(void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

-(CGFloat)centerX {
    return self.center.x;
}

-(void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

-(CGFloat)centerY {
    return self.center.y;
}

-(void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

-(CGFloat)ttScreenX {
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += view.left;
    }
    return x;
}

-(CGFloat)ttScreenY {
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.top;
    }
    return y;
}

-(CGFloat)screenViewX {
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += view.left;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            x -= scrollView.contentOffset.x;
        }
    }
    
    return x;
}

-(CGFloat)screenViewY {
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.top;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            y -= scrollView.contentOffset.y;
        }
    }
    return y;
}

-(CGRect)screenFrame {
    return CGRectMake(self.screenViewX, self.screenViewY, self.width, self.height);
}

-(CGPoint)origin {
    return self.frame.origin;
}

-(void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

-(CGFloat)originX {
    return self.frame.origin.x;
}

-(void)setOriginX:(CGFloat)originX {
    CGRect frame = self.frame;
    frame.origin.x = originX;
    self.frame = frame;
}

-(CGFloat)originY {
    return self.frame.origin.y;
}

-(void)setOriginY:(CGFloat)originY {
    CGRect frame = self.frame;
    frame.origin.y = originY;
    self.frame = frame;
}

-(CGSize)size {
    return self.frame.size;
}

-(void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (UIViewController *)controller {
    UIViewController *controller = nil;
    for (UIView *next = self.superview; next; next = next.superview) {
        UIResponder *nextResponder = next.nextResponder;
        if ([nextResponder isKindOfClass:UIViewController.class]) {
            controller = (UIViewController*)nextResponder;
            break;
        }
    }
    return controller;
}

/// 页面点击
/// @param callBack 点击回调
- (void)addTapGesture:(void(^)(UITapGestureRecognizer *recognizer))callBack {
    self.tapCallBack = callBack;
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAdditionAction:)];
    [self addGestureRecognizer:tapGesture];
}

- (void)tapAdditionAction:(UITapGestureRecognizer *)tapGestureRecognizer {
    if (self.tapCallBack) {
        self.tapCallBack(tapGestureRecognizer);
    }
}

- (void)setTapCallBack:(void (^)(UITapGestureRecognizer *))tapCallBack {
    objc_setAssociatedObject(self, &TapCallBackKey, tapCallBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UITapGestureRecognizer *))tapCallBack {
    return objc_getAssociatedObject(self, &TapCallBackKey);
}

@end
