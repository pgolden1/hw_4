//
//  MainGameViewController.m
//  HighwayTraveler
//
//  Created by Peter Golden on 3/9/19.
//  Copyright © 2019 Peter Golden. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainGameViewController.h"

@implementation MainGVC

-(void)viewDidLoad {
    [super viewDidLoad];
    
    // Set the delegate
    self.hwv.delegate = self;
}

-(void)highwayView:(UIView *)view performSegueWithIdentifier:(NSString *)identifier {
    [self performSegueWithIdentifier:identifier sender:self];
}

@end
