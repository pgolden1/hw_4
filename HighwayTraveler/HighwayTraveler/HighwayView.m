//
//  HighwayView.m
//  HighwayTraveler
//
//  Created by Peter Golden on 3/8/19.
//  Copyright © 2019 Peter Golden. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HighwayView.h"

@implementation HighwayView

-(id) initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    
    if(self){
    
        _currLane = [NSNumber numberWithInt: 2];
        _currLimit = 55;
        _currSpeed = 45;
        _currScore = 0;
        _currDistance = 0;
        _counter = 267;
        _laneCounter = 0;
        _currLane = [NSNumber numberWithInt: 3];
        _tickspeed = 0.0375;
        _hasBeenSet = false;
        _availToChange = false;
        _changingLane = false;
        _gameend = false;
        _copIconActive = false;
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
        
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval: _tickspeed repeats:YES block:^(NSTimer * _Nonnull timer) {
            [self performSelectorOnMainThread:@selector(tick:) withObject:self.timer waitUntilDone:NO];
        }];
    }
    
    return self;
}


-(IBAction) changeLaneL: (UIButton*) sender{
    if(!_changingLane){
        if([_currLane intValue] != 1){
            _currLane = [NSNumber numberWithInt: ([_currLane intValue] - 1)];
            _changingLane = true;
            _changingDirection = false;
            _laneCounter = 99;
        }
       else{
           _changingLane = true;
           _changingDirection = false;
           _laneCounter = 25;
           _gameend = true;
        }
       
    }
}

- (IBAction) changeLaneR: (UIButton*) sender{
    if(!_changingLane){
        if([_currLane intValue] == 4){
            _currLane = [NSNumber numberWithInt: ([_currLane intValue] + 1)];
            _changingLane = true;
            _changingDirection = true;
            _laneCounter = 99;
            _gameend = true;
        }
        else{
            _changingLane = true;
            _changingDirection = true;
            _laneCounter = 25;
        }
    }
}

-(double) max: (double)a withSecond:(double)b {
    return (a > b) ? a : b;
}

- (IBAction) speedUp: (UIButton*) sender{
    if(_currSpeed < 130) _currSpeed += 5;
}

- (IBAction) speedDown: (UIButton*) sender{
    if(_currSpeed > 10) _currSpeed -= 5;
}

- (void) moveMarker: (UIImageView*) marker{
    
    CGRect markerRect = marker.frame;
    CGRect roadRect = _road.frame;
    markerRect.origin.y += [self max: 2.0 withSecond: 1.2 * pow((_currSpeed/17), 1.6)];
    
    
    if(CGRectGetMaxY(markerRect) > CGRectGetMaxY(roadRect) + 5) markerRect.origin.y = CGRectGetMinY(roadRect);
    marker.frame = markerRect;
    
    
}

- (void) endGame{
    
    
}

-(void) tick: (id) sender{
    //init
    if(!_hasBeenSet){
        _currentCar.image = (UIImage*) _carIcons[_currCar];
        _you.image = (UIImage*) _cars[_currCar];
        _hasBeenSet = true;
    }
    
    
    
    //changing display of current speed and score
    NSString* speed = [NSString stringWithFormat:@"%d", _currSpeed];
    [_currentSpeed setText: speed];
    
    
    _currDistance += _currSpeed * _tickspeed;
    _currScore += _currSpeed * _tickspeed;
    
    NSString* score = [NSString stringWithFormat:@"%d", (int) _currScore];
    [_currentScore setText: score];

    
    
    
    //adjusting speed limit
    if(_availToChange){
        
        int speedGen = arc4random_uniform(100);
        
        if(speedGen < 2 && _currLimit < 85){
            _currLimit -= 5;
            _availToChange = false;
            _counter = 200;
        }
        
        if(speedGen > 97 && _currLimit > 20){
            _currLimit += 5;
            _availToChange = false;
            _counter = 200;
        }
    }
    
    if(_counter > 0) _counter--;
    if(_counter == 0) _availToChange = true;
    
    NSString* newlimit = [NSString stringWithFormat:@"%d", _currLimit];
    [_speedLimit setText: newlimit];
    
    
    
    
    
    //x coordinates of lanes:
    //lane 1: 35
    //lane 2: 134
    //lane 3: 233
    //lane 4: 332
    
    //animation for changing lane
    if(_changingLane){
        CGRect yourcar = _you.frame;
        if(_changingDirection){
            yourcar.origin.x += 1;
            _laneCounter--;
            
        }
        else{
            yourcar.origin.x -= 1;
            _laneCounter--;
        }
        
        _you.frame = yourcar;
        
        if(_laneCounter == 0){
            _changingLane = false;
            if(_gameend) [self endGame];
        }
    }
    
    

    
    //cops
    CGRect copIconBox = _copIcon.frame;
    
    
    if(_copIconActive){

        copIconBox.origin.y += 3;
        _copIcon.frame = copIconBox;
        
        if(copIconBox.origin.y > 360 && copIconBox.origin.y < 400){
            if(_currSpeed > _currLimit){
                
                if((_currSpeed / _currLimit > 1.35) || (_currSpeed - _currLimit > 30)) {
                    _spawnCop = true;
                }
            }
        }
        
        if(CGRectGetMaxY(copIconBox) > 760){
            _copIcon.alpha = 0.0f;
            _copIconActive = false;
        }
        
    } else{
        int randomCop = arc4random_uniform(2500000/_currSpeed);
        
        if(randomCop < _currSpeed){
            
            _copIcon.alpha = 1.0f;
            
            copIconBox.origin.y = 123;
            _copIcon.frame = copIconBox;
            
            _copIconActive = true;
        }
        
    }
    
    if(_spawnCop){
        _cop.alpha = 1.0f;
    }
    
    
    
    
    [self moveMarker: _marker1];
    [self moveMarker: _marker2];
    [self moveMarker: _marker3];
    [self moveMarker: _marker4];
    [self moveMarker: _marker5];
    [self moveMarker: _marker6];
    [self moveMarker: _marker7];
    [self moveMarker: _marker8];
    [self moveMarker: _marker9];
    [self moveMarker: _marker10];
    [self moveMarker: _marker11];
    [self moveMarker: _marker12];
    
}

@end


