//
//  VarizViewController.h
//  Variz
//
//  Created by Marc Peabody on 7/10/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardView.h"

@interface VarizViewController : UIViewController {
	IBOutlet UIScrollView *sillyScroll;
	NSMutableArray *cardOrder;
	IBOutlet UILabel *directions;
	IBOutlet UIView *dashboard;
	int numberFound;
}
@property(retain, nonatomic) IBOutlet UILabel *directions;
@property(retain, nonatomic) UIScrollView *sillyScroll;
@property (nonatomic, retain) IBOutlet NSMutableArray *cardOrder;
@property (nonatomic, retain) IBOutlet UIView *dashboard;
-(void)setUpWorld;
-(void)tryToSelect:(CardView*)cardView;
@end

