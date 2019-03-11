//
//  Universe.h
//  HighwayTraveler
//
//  Created by Peter Golden on 2/11/19.
//  Copyright © 2019 Peter Golden. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Universe : NSObject
@property(nonatomic) int distance;
@property (nonatomic) int score;
+(Universe *)getSingleton;

@end

NS_ASSUME_NONNULL_END
