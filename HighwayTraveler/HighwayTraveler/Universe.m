//
//  Universe.m
//  2048CSGame
//
//  Created by Peter Golden on 2/11/19.
//  Copyright © 2019 Peter Golden. All rights reserved.
//

#import "Universe.h"

@implementation Universe
@synthesize distance;
@synthesize score;

static Universe *singleton = nil;

-(id)init
{
    if (singleton)
        return singleton;
    
    self = [super init];
    if (self)
    {
        distance = 0;
        score = 0;
    }
    singleton = self;
    return self;
}

+(Universe *)getSingleton
{
    return singleton;
}
@end
