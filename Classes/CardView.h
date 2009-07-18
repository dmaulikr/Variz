//
//  CardView.h
//  Memory
//
//  Created by Marc Peabody on 6/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VarizViewController;

@interface CardView : UIView {
	UIImage *hiddenImage;
	int cardType;
	VarizViewController *master;
	BOOL faceUp;
	NSString *pictureName;
}
@property (nonatomic, retain) UIImage *hiddenImage;
@property (nonatomic, retain) VarizViewController *master;
@property (nonatomic, retain) NSString *pictureName;

-(void)setType:(int)val;
-(void)setFaceUp;
-(void)setFaceDown;
-(BOOL)isFaceUp;
-(BOOL)matches:(CardView*)otherCard;
-(int)cardType; // a 1-54 value indicating which card this is
@end
