//
//  CTGradientView.h
//
//  Created by Chad Weider on 12/2/05.
//  Copyright (c) 2005 Chad Weider.
//  Some rights reserved: <http://creativecommons.org/licenses/by/2.5/>
//

#if !__has_feature(objc_arc)
#error This class requires automatic reference counting
#endif

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
@class CTGradient;
#define View UIView
#define Rect CGRect
#define setNeedsDisplay [self setNeedsDisplay]
#else
#import <Cocoa/Cocoa.h>
#define View NSView
#define Rect NSRect
#define setNeedsDisplay [self setNeedsDisplay:YES]
#endif

#import "CTGradient.h"

@interface CTGradientView : View

@property(nonatomic, retain) CTGradient *gradient;
@property(nonatomic, assign) CGFloat angle;
@property(nonatomic, assign, getter = isRadial) BOOL radial;

@end
