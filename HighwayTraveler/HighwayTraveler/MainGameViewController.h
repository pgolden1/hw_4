//
//  MainGameViewController.h
//  HighwayTraveler
//
//  Created by Peter Golden on 3/9/19.
//  Copyright © 2019 Peter Golden. All rights reserved.
//

#ifndef MainGameViewController_h
#define MainGameViewController_h
#import "HighwayView.h"
#import <UIKit/UIKit.h>

@interface MainGVC : UIViewController <HighwayViewDelegate>

@property (weak, nonatomic) HighwayView* hwv;

-(void)highwayView:(HighwayView *)view performSegueWithIdentifier:(NSString *)identifier;

@end

#endif /* MainGameViewController_h */
