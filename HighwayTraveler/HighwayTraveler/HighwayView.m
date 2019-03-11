//
//  HighwayView.m
//  HighwayTraveler
//
//  Created by Peter Golden on 3/8/19.
//  Copyright © 2019 Peter Golden. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HighwayView.h"
#import "Universe.h"

@implementation HighwayView

-(id) initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    
    if(self){
    
        _currLane = 2;
        _currLimit = 45;
        _currSpeed = 50;
        _currScore = 0;
        _currDistance = 0;
        
        _currCar = arc4random_uniform(12);
        
        NSLog(@"%d", _currCar);
        
        _cars = [NSArray arrayWithObjects: [UIImage imageNamed: @"blue"],
                  [UIImage imageNamed: @"fuscia"],
                  [UIImage imageNamed: @"gray"],
                  [UIImage imageNamed: @"green"],
                  [UIImage imageNamed: @"lime"],
                  [UIImage imageNamed: @"magenta"],
                  [UIImage imageNamed: @"orange"],
                  [UIImage imageNamed: @"orangeyellow"],
                  [UIImage imageNamed: @"purple"],
                  [UIImage imageNamed: @"red"],
                  [UIImage imageNamed: @"turquoise"],
                  [UIImage imageNamed: @"yellow"],
                 nil];
        
        _carIcons = [NSArray arrayWithObjects: [UIImage imageNamed: @"bluerotated"],
                 [UIImage imageNamed: @"fusciarotated"],
                 [UIImage imageNamed: @"grayrotated"],
                 [UIImage imageNamed: @"greenrotated"],
                 [UIImage imageNamed: @"limerotated"],
                 [UIImage imageNamed: @"magentarotated"],
                 [UIImage imageNamed: @"orangerotated"],
                 [UIImage imageNamed: @"orangeyellowrotated"],
                 [UIImage imageNamed: @"purplerotated"],
                 [UIImage imageNamed: @"redrotated"],
                 [UIImage imageNamed: @"turquoiserotated"],
                 [UIImage imageNamed: @"yellowrotated"],
                 nil];
        
        _currentCar.image = (UIImage*) _carIcons[_currCar];
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
            [self performSelectorOnMainThread:@selector(tick:) withObject:self.timer waitUntilDone:NO];
        }];
    }
    return self;
}




-(IBAction) changeLaneL: (UIButton*) sender{
   _currLane--;
    if(_currLane == 0){
        //fall off map, lose
    }
    else{
        
    }
}

- (IBAction) changeLaneR: (UIButton*) sender{
    _currLane++;
    if(_currLane == 4){
        //fall off map, lose
        Universe *u = [Universe getSingleton];
        [u setDistance:0];
        [u setDistance:0];
        [self.delegate highwayView:self performSegueWithIdentifier:@"GameEnd"];
    }
    else{
        
    }
}

- (IBAction) speedUp: (UIButton*) sender{
    _currSpeed += 5;
}

- (IBAction) speedDown: (UIButton*) sender{
    _currSpeed -= 5;
}

-(void) tick: (id) sender{
    
    
}

@end


