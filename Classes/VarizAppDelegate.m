//
//  VarizAppDelegate.m
//  Variz
//
//  Created by Marc Peabody on 7/10/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "VarizAppDelegate.h"
#import "VarizViewController.h"

@implementation VarizAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
