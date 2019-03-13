//
//  HighwayView.h
//  HighwayTraveler
//
//  Created by Peter Golden on 3/8/19.
//  Copyright © 2019 Peter Golden. All rights reserved.
//

#ifndef HighwayView_h
#define HighwayView_h
#import <UIKit/UIKit.h>
#import "Universe.h"

@protocol HighwayViewDelegate

-(void)highwayView: (UIView*)view performSegueWithIdentifier:(NSString *)identifier;

@end

@interface HighwayView: UIView

@property (nonatomic, weak) id<HighwayViewDelegate> delegate;

@property (nonatomic) int currSpeed;
@property (nonatomic) int currLimit;
@property (nonatomic) int currScore;
@property (nonatomic) int currDistance;
@property (nonatomic) int currCar;
@property (nonatomic) int counter;
@property (nonatomic) bool hasBeenSet;
@property (nonatomic) bool availToChange;
@property (nonatomic) bool changingLane;
@property (nonatomic) bool changingDirection; // true for right
@property (nonatomic, strong) NSNumber* currLane;
@property (nonatomic, strong) NSTimer* timer;
@property (nonatomic) Universe* u;

@property (nonatomic, strong) NSArray* cars;
@property (nonatomic, strong) NSArray* carIcons;

@property (weak, nonatomic) IBOutlet UILabel *currentSpeed;
@property (weak, nonatomic) IBOutlet UILabel *speedLimit;
@property (weak, nonatomic) IBOutlet UILabel *currentScore;
@property (weak, nonatomic) IBOutlet UIImageView *currentCar;

@property (strong, nonatomic) IBOutlet UIButton* cLaneL;
@property (strong, nonatomic) IBOutlet UIButton* cLaneR;
@property (strong, nonatomic) IBOutlet UIButton* sUp;
@property (strong, nonatomic) IBOutlet UIButton* sDown;
@property (strong, nonatomic) IBOutlet UIButton* menu;
@property (strong, nonatomic) IBOutlet UIButton* endGame;

- (IBAction) changeLaneL: (UIButton*) sender;
- (IBAction) changeLaneR: (UIButton*) sender;
- (IBAction) speedUp: (UIButton*) sender;
- (IBAction) speedDown: (UIButton*) sender;
- (void) tick: (id) sender;

@end

#endif /* HighwayView_h */
