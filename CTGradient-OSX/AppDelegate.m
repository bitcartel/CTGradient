//
//  AppDelegate.m
//  CTGradient-OSX
//
//  Created by Dominik Pich on 03/05/14.
//
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [[NSNotificationCenter defaultCenter] addObserverForName:NSWindowWillCloseNotification object:nil queue:nil usingBlock:^(NSNotification *note) {
        [NSApp terminate:nil];
    }];
}

#pragma mark - 

- (IBAction)changeAngle:(id)sender {
	self.gradientView.angle = 90.0 - [sender floatValue];
}

- (IBAction)changeType:(id)sender {
    BOOL isRadial;
    
	if ([[[sender selectedCell] title] isEqualToString:@"Axial"])
		isRadial = NO;
	else
		isRadial = YES;
    
	self.gradientView.radial = isRadial;
}

- (IBAction)changeStyle:(id)sender {
    CTGradient *myGradient;
    
	switch ([sender indexOfSelectedItem]) {
		case 0: myGradient = [CTGradient rainbowGradient];
			break;
            
		case  1: myGradient = [CTGradient aquaSelectedGradient];
			break;
            
		case  2: myGradient = [CTGradient aquaNormalGradient];
			break;
            
		case  3: myGradient = [CTGradient aquaPressedGradient];
			break;
            
		case  4: myGradient = [CTGradient unifiedSelectedGradient];
			break;
            
		case  5: myGradient = [CTGradient unifiedNormalGradient];
			break;
            
		case  6: myGradient = [CTGradient unifiedPressedGradient];
			break;
            
		case  7: myGradient = [CTGradient unifiedDarkGradient];
			break;
            
		case  8: myGradient = [CTGradient sourceListSelectedGradient];
			break;
            
		case  9: myGradient = [CTGradient sourceListUnselectedGradient];
			break;
            
		case 10: myGradient = [CTGradient hydrogenSpectrumGradient];
			break;
            
		default: myGradient = [CTGradient gradientWithBeginningColor:[NSColor blackColor]
			                                             endingColor:[NSColor whiteColor]];
	}
    
	self.gradientView.gradient = myGradient;
}

@end
