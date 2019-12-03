//
//  UIScrollView+Addition.m
//  Addition_Example
//
//  Created by 蔡成汉 on 2019/12/3.
//  Copyright © 2019 蔡成汉. All rights reserved.
//

#import "UIScrollView+Addition.h"

@interface UIScrollView ()<UIGestureRecognizerDelegate>

@end

@implementation UIScrollView (Addition)

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if ([self panBack:gestureRecognizer]) {
        return YES;
    }
    return NO;
}

- (BOOL)panBack:(UIGestureRecognizer *)gestureRecognizer {
    NSInteger location_X = 0.1*UIScreen.mainScreen.bounds.size.width;
    if (gestureRecognizer ==self.panGestureRecognizer) {
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
        CGPoint point = [pan translationInView:self];
        UIGestureRecognizerState state = gestureRecognizer.state;
        if (UIGestureRecognizerStateBegan == state ||UIGestureRecognizerStatePossible == state) {
            CGPoint location = [gestureRecognizer locationInView:self];
            NSInteger temp1 = location.x;
            NSInteger temp2 = UIScreen.mainScreen.bounds.size.width;
            NSInteger XX = temp1 % temp2;
            if (point.x >0 && XX < location_X) {
                return YES;
            }
        }
    }
    return NO;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([self panBack:gestureRecognizer]) {
        return NO;
    }
    return YES;
}


@end
