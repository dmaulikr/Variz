//
//  VarizViewController.m
//  Variz
//
//  Created by Marc Peabody on 7/10/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "VarizViewController.h"
#import "CardView.h"

@implementation VarizViewController

@synthesize directions;
@synthesize dashboard;
@synthesize sillyScroll;
@synthesize cardOrder;
/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[sillyScroll setContentSize: CGSizeMake(1000, 1400)];
	[self setUpWorld];
}

-(void)setUpWorld{
	//NSLog(@"setUpMemoryGameView");
	[self.sillyScroll contentSize];
	CGFloat full_width = [self.sillyScroll contentSize].width;
	CGFloat full_height = [self.sillyScroll contentSize].height;
	CGFloat height = full_height/9;
	CGFloat width = full_width/6;
	//int type = 1;
	
	// http://iphonedevelopment.blogspot.com/2008/10/random-thoughts-rand-vs-arc4random.html
	// you need to generate a floating point number with arc4random() 
#define ARC4RANDOM_MAX      0x100000000
	
	cardOrder = [[NSMutableArray alloc] init];
	for(int i=1; i<55; i++) [self.cardOrder addObject:[NSNumber numberWithInteger:i]];
	
	for(int x=0; x<full_width-width+1; x=x+width){
		for(int y=20; y<full_height+20-height+1; y=y+height){
			CGRect frame = CGRectMake((arc4random()%(int)full_width), (arc4random()%(int)full_height), 32, 44);
			//NSLog(@"%f %f",frame.origin.x,frame.origin.y);
			CardView *cardView = [[CardView alloc] initWithFrame:frame];
			[cardView setMaster:self];
			
			NSInteger ind = (arc4random()%[self.cardOrder count] );
			NSInteger thiscardnumber = [[self.cardOrder objectAtIndex:ind] intValue];
			[self.cardOrder removeObjectAtIndex:ind];
			[cardView setType:thiscardnumber];
			[cardView setFaceUp]; // cheat to see if our random ordering is working ATM
			[sillyScroll addSubview:cardView];
			[cardView release];
		}
	}
	[directions setText:@"Find all the hearts"];
	numberFound = (int)0;
}

-(void)tryToSelect:(CardView*)cardView {
	if([[cardView pictureName] hasPrefix:@"hearts"]){
		numberFound = numberFound + 1;
		[cardView removeFromSuperview];
		CGRect frame = CGRectMake((10+(10*numberFound)), 18, [cardView frame].size.width, [cardView frame].size.height);
		[cardView setFrame: frame];
		[dashboard addSubview:cardView];
	}
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (void)dealloc {
	[sillyScroll release];
	[cardOrder release];
    [super dealloc];
}

@end
