//
//  CTGradientView.m
//
//  Created by Chad Weider on 12/2/05.
//  Copyright (c) 2005 Chad Weider.
//  Some rights reserved: <http://creativecommons.org/licenses/by/2.5/>
//

#import "CTGradientView.h"

@implementation CTGradientView

- (id)initWithFrame:(Rect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		_gradient = [CTGradient rainbowGradient];
		_angle = 90;
		_radial = NO;
	}
	return self;
}

#if TARGET_OS_IPHONE
#else
- (BOOL)isOpaque {
	return NO;
}
#endif

- (void)drawRect:(Rect)rect {
	if (self.isRadial) {
		[self.gradient radialFillRect:rect];
    }
	else {
		[self.gradient fillRect:rect angle:self.angle];
    }
}

- (void)setGradient:(CTGradient *)gradient {
    _gradient = gradient;
    setNeedsDisplay;
}

- (void)setAngle:(CGFloat)angle {
    _angle = angle;
    setNeedsDisplay;
}

- (void)setRadial:(BOOL)radial {
    _radial = radial;
    setNeedsDisplay;
}

@end
