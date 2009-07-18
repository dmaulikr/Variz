//
//  CardView.m
//  Memory
//
//  Created by Marc Peabody on 6/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CardView.h"

@implementation CardView

@synthesize hiddenImage;
@synthesize pictureName;
@synthesize master;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		self.userInteractionEnabled = YES;
		cardType = 0;  // a 1-54 value indicating which card this is
		faceUp = NO;
    }
    return self;
}

-(void)setType:(int)val { // a number 1-54
	//sets appropriate card image for 1-54
	cardType = val;
	//also sets the card's face "hidden" image
	pictureName = @"";
	if(cardType>52){//joker
		if(cardType==53){
			pictureName = [pictureName stringByAppendingString:@"joker-r"];
		}else{
			pictureName = [pictureName stringByAppendingString:@"joker-b"];	
		}
	}else{//non-joker
		int card_suit = cardType/13;
		int card_value = (cardType-1)%13;
		if(card_suit==0){
			pictureName = [pictureName stringByAppendingString:@"hearts"];	
		}else if(card_suit==1){
			pictureName = [pictureName stringByAppendingString:@"clubs"];
		}else if(card_suit==2){
			pictureName = [pictureName stringByAppendingString:@"spades"];
		}else{
			pictureName = [pictureName stringByAppendingString:@"diamonds"];
		}
		if(card_value==1){
			pictureName = [pictureName stringByAppendingString:@"-a"];
		}else if(card_value==11){
			pictureName = [pictureName stringByAppendingString:@"-j"];
		}else if(card_value==12){
			pictureName = [pictureName stringByAppendingString:@"-q"];
		}else if(card_value==0){
			pictureName = [pictureName stringByAppendingString:@"-k"];
		}else{
			NSString *val = [NSString stringWithFormat:@"-%i", card_value];
			pictureName = [pictureName stringByAppendingString:val];
		}
	}
	pictureName = [pictureName stringByAppendingString:@"-75.png"];
	NSLog(pictureName);
	hiddenImage = [UIImage imageNamed:pictureName];
}

- (void)drawRect:(CGRect)rect {
	if(faceUp){
		[hiddenImage drawInRect:rect];	
	}else{
		// TODO should this be a static value to preserve memory?
		UIImage *backsideImage = [UIImage imageNamed:@"back-blue-75-1.png"];
		[backsideImage drawInRect:rect];
	}
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[master tryToSelect:self];
}

-(void)setFaceUp{
	faceUp = YES;
}
-(void)setFaceDown{
	faceUp = NO;
}
-(BOOL)isFaceUp{
	return faceUp;
}
-(BOOL)matches:(CardView*)otherCard{
	if(cardType > 52 && [otherCard cardType] > 52){
		return YES; // both jokers
	}else if(cardType%13 == [otherCard cardType]%13){
		return YES; // same card value (ie both are kings)
	}
	return NO;
}
-(int)cardType{
	return cardType;
}

- (void)dealloc {
    [super dealloc];
}
@end