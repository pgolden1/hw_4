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

@interface HighwayView: UIView

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

@property (weak, nonatomic) IBOutlet UIImageView *marker1;
@property (weak, nonatomic) IBOutlet UIImageView *marker2;
@property (weak, nonatomic) IBOutlet UIImageView *marker3;
@property (weak, nonatomic) IBOutlet UIImageView *marker4;
@property (weak, nonatomic) IBOutlet UIImageView *marker5;
@property (weak, nonatomic) IBOutlet UIImageView *marker6;
@property (weak, nonatomic) IBOutlet UIImageView *marker7;
@property (weak, nonatomic) IBOutlet UIImageView *marker8;
@property (weak, nonatomic) IBOutlet UIImageView *marker9;
@property (weak, nonatomic) IBOutlet UIImageView *marker10;
@property (weak, nonatomic) IBOutlet UIImageView *marker11;
@property (weak, nonatomic) IBOutlet UIImageView *marker12;
@property (weak, nonatomic) IBOutlet UIImageView *marker13;
@property (weak, nonatomic) IBOutlet UIImageView *marker14;
@property (weak, nonatomic) IBOutlet UIImageView *marker15;






@property (strong, nonatomic) IBOutlet UIButton* cLaneL;
@property (strong, nonatomic) IBOutlet UIButton* cLaneR;
@property (strong, nonatomic) IBOutlet UIButton* sUp;
@property (strong, nonatomic) IBOutlet UIButton* sDown;
@property (strong, nonatomic) IBOutlet UIButton* menu;

- (IBAction) changeLaneL: (UIButton*) sender;
- (IBAction) changeLaneR: (UIButton*) sender;
- (IBAction) speedUp: (UIButton*) sender;
- (IBAction) speedDown: (UIButton*) sender;
- (void) tick: (id) sender;
- (void) moveMarkers;

@end

#endif /* HighwayView_h */
