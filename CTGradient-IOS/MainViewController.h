//
//  MainViewController.h
//  CTGradient-IOS
//
//  Created by Dominik Pich on 03/05/14.
//
//

#import "FlipsideViewController.h"
#import "CTGradientView.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@property (assign) IBOutlet CTGradientView *gradientView;

//- (IBAction)changeType:(id)sender;
//- (IBAction)changeAngle:(id)sender;
//- (IBAction)changeStyle:(id)sender;

@end
