//
//  AppDelegate.h
//  CTGradient-OSX
//
//  Created by Dominik Pich on 03/05/14.
//
//

#import <Cocoa/Cocoa.h>
#import "CTGradientView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet CTGradientView *gradientView;

- (IBAction)changeType:(id)sender;
- (IBAction)changeAngle:(id)sender;
- (IBAction)changeStyle:(id)sender;

@end
