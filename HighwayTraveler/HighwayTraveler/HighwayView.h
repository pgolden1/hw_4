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

@interface HighwayView: UIView


@property (strong, nonatomic) UILabel* currentSpeed;
@property (strong, nonatomic) UILabel* currentSscore;

@property (strong, nonatomic) UIButton* cLaneL;
@property (strong, nonatomic) UIButton* cLaneR;
@property (strong, nonatomic) UIButton* sUp;
@property (strong, nonatomic) UIButton* sDown;
@property (strong, nonatomic) UIButton* menu;



@end

#endif /* HighwayView_h */
