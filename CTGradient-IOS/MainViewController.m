//
//  MainViewController.m
//  CTGradient-IOS
//
//  Created by Dominik Pich on 03/05/14.
//
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.gradientView.angle = 45;
    self.gradientView.radial = NO;
    self.gradientView.gradient = [CTGradient rainbowGradient];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
    }
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.flipsidePopoverController = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
            self.flipsidePopoverController = popoverController;
            popoverController.delegate = self;
        }
    }
}

- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}

#pragma mark -

//- (IBAction)changeAngle:(id)sender {
//	self.gradientView.angle = 90.0 - [sender floatValue];
//}
//
//- (IBAction)changeType:(id)sender {
//    BOOL isRadial;
//    
//	if ([[[sender selectedCell] title] isEqualToString:@"Axial"])
//		isRadial = NO;
//	else
//		isRadial = YES;
//    
//	self.gradientView.radial = isRadial;
//}
//
//- (IBAction)changeStyle:(id)sender {
//    CTGradient *myGradient;
//    
//	switch ([sender indexOfSelectedItem]) {
//		case 0: myGradient = [CTGradient rainbowGradient];
//			break;
//            
//		case  1: myGradient = [CTGradient aquaSelectedGradient];
//			break;
//            
//		case  2: myGradient = [CTGradient aquaNormalGradient];
//			break;
//            
//		case  3: myGradient = [CTGradient aquaPressedGradient];
//			break;
//            
//		case  4: myGradient = [CTGradient unifiedSelectedGradient];
//			break;
//            
//		case  5: myGradient = [CTGradient unifiedNormalGradient];
//			break;
//            
//		case  6: myGradient = [CTGradient unifiedPressedGradient];
//			break;
//            
//		case  7: myGradient = [CTGradient unifiedDarkGradient];
//			break;
//            
//		case  8: myGradient = [CTGradient sourceListSelectedGradient];
//			break;
//            
//		case  9: myGradient = [CTGradient sourceListUnselectedGradient];
//			break;
//            
//		case 10: myGradient = [CTGradient hydrogenSpectrumGradient];
//			break;
//            
//		default: myGradient = [CTGradient gradientWithBeginningColor:[NSColor blackColor]
//			                                             endingColor:[NSColor whiteColor]];
//	}
//    
//	self.gradientView.gradient = myGradient;
//}

@end
