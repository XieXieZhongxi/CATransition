//
//  CALayer+transition.m
//  CATransition
//
//  Created by Zhongxi on 2017/2/5.
//  Copyright © 2017年 zhongxi. All rights reserved.
//

#import "CALayer+transition.h"

@implementation CALayer (transition)
-(void)addAnimationDuration:(CGFloat)duration type:(CATransitionType)type subtype:(CATransitionSubtype)subtype{
    NSString * animationType = [self typeString:type];
    NSString * animationSubtype = [self subtypeString:subtype];
    CATransition * animation = [CATransition animation];
    animation.duration = duration;
    animation.type = animationType;
    animation.subtype = animationSubtype;
    [self addAnimation:animation forKey:nil];
}

-(NSString *)typeString:(CATransitionType)type{
    switch (type) {
        case CAT_fade:
            return @"fade";
            break;
        case CAT_push:
            return @"push";
            break;
        case CAT_moveIn:
            return @"moveIn";
            break;
        case CAT_reveal:
            return @"reveal";
            break;
        case CAT_cube:
            return @"cube";
            break;
        case CAT_oglFlip:
            return @"oglFlip";
            break;
        case CAT_suckEffect:
            return @"suckEffect";
            break;
        case CAT_rippleEffect:
            return @"rippleEffect";
            break;
        case CAT_pageCurl:
            return @"pageCurl";
            break;
        case CAT_pageUnCurl:
            return @"pageUnCurl";
            break;
        case CAT_cameraIrisHollowOpen:
            return @"cameraIrisHollowOpen";
            break;
        case CAT_cameraIrisHollowClose:
            return @"cameraIrisHollowClose";
            break;
    }
}

-(NSString *)subtypeString:(CATransitionSubtype)type{
    switch (type) {
        case CATS_transitionFromRight:
            return kCATransitionFromRight;
            break;
        case CATS_transitionFromLeft:
            return kCATransitionFromLeft;
            break;
        case CATS_transitionFromTop:
            return kCATransitionFromTop;
            break;
        case CATS_transitionFromBottom:
            return kCATransitionFromBottom;
            break;
    }
}
@end
