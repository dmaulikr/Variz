//
//  VarizAppDelegate.h
//  Variz
//
//  Created by Marc Peabody on 7/10/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VarizViewController;

@interface VarizAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    VarizViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet VarizViewController *viewController;

@end

