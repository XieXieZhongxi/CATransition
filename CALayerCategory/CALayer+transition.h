//
//  CALayer+transition.h
//  CATransition
//
//  Created by Zhongxi on 2017/2/5.
//  Copyright © 2017年 zhongxi. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

/**
 CATransition type
 */
typedef NS_ENUM(NSInteger , CATransitionType) {
    CAT_fade, /* Cross fade transition (does not support the transition direction) */
    CAT_push, /* New the old views out */
    CAT_moveIn, /* A new view to old view above */
    CAT_reveal, /* The old view, display the new view */
    CAT_cube, /* Cube rolling effect */
    CAT_oglFlip, /* The up and down or so flip effect */
    CAT_suckEffect, /* Shrinkage effect, such as a piece of cloth was siphoned off (does not support the transition direction) */
    CAT_rippleEffect, /* Effect of water (do not support the transition direction) */
    CAT_pageCurl, /* Page up effect */
    CAT_pageUnCurl, /* Flip down effect */
    CAT_cameraIrisHollowOpen, /* Open camera lens effect (does not support the transition direction) */
    CAT_cameraIrisHollowClose /* Close camera lens effect (does not support the transition direction) */
};

/**
 CATransition subtype
 */
typedef NS_ENUM(NSInteger , CATransitionSubtype) {
    CATS_transitionFromLeft,
    CATS_transitionFromRight,
    CATS_transitionFromTop,
    CATS_transitionFromBottom
};
@interface CALayer (transition)

/**
 CALayer add animation

 @param duration The duration
 @param type CATransitionType
 @param subtype CATransitionSubtype
 */
-(void)addAnimationDuration:(CGFloat)duration type:(CATransitionType)type subtype:(CATransitionSubtype)subtype;
@end
