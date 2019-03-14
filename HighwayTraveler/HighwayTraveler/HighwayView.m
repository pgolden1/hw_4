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
    
        _currLane = [NSNumber numberWithInt: 2];
        _currLimit = 55;
        _currSpeed = 45;
        _currScore = 0;
        _currDistance = 0;
        _counter = 100;
        _currLane = [NSNumber numberWithInt: 3];
        _hasBeenSet = false;
        _availToChange = false;
        _changingLane = false;
        _changingLane = true;
        _u = [Universe getSingleton];
        _currCar = arc4random_uniform(12);
        
        
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
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
            [self performSelectorOnMainThread:@selector(tick:) withObject:self.timer waitUntilDone:NO];
        }];
    }
    
    return self;
}


-(IBAction) changeLaneL: (UIButton*) sender{
    
   _currLane = [NSNumber numberWithInt: ([_currLane intValue] - 1)];
    if([_currLane intValue] == 0){
        //fall off map, lose
    }
    else{
        
    }
}

- (IBAction) changeLaneR: (UIButton*) sender{
    _currLane = [NSNumber numberWithInt: ([_currLane intValue] + 1)];
    _changingLane = true;
    _changingDirection = true;
    if([_currLane intValue] == 5){
        //fall off map, lose
        [_u setDistance:0];
        [_u setDistance:0];
        
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

- (void) moveMarkers{
    
    //repeat for each marker
    UIImageView* currentMarker = (UIImageView*) _marker1;
    CGRect cMRect = currentMarker.frame;
    cMRect.origin.y += 1;
    _marker1.frame = cMRect;
    
}

-(void) tick: (id) sender{
    if(!_hasBeenSet){
        _currentCar.image = (UIImage*) _carIcons[_currCar];
        _hasBeenSet = true;
    }
    
    //changing display of current speed
    NSString* speed = [NSString stringWithFormat:@"%d", _currSpeed];
    [_currentSpeed setText: speed];

    
    //adjusting speed limit
    if(_availToChange){
        
        int speedGen = arc4random_uniform(100);
        
        if(speedGen < 2 && _currLimit < 85){
            _currLimit -= 5;
            _availToChange = false;
            _counter = 75;
        }
        
        if(speedGen > 97 && _currLimit > 20){
            _currLimit += 5;
            _availToChange = false;
            _counter = 75;
        }
    }
    
    if(_counter > 0) _counter--;
    if(_counter == 0) _availToChange = true;
    
    NSString* newlimit = [NSString stringWithFormat:@"%d", _currLimit];
    [_speedLimit setText: newlimit];
    
    //animation for changing lane
    if(_changingLane){
        if(_changingDirection){
            
            
        }
    }
    
    //[self moveMarkers];
    
}

@end


