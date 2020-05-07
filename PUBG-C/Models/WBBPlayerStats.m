//
//  WBBPlayerStats.m
//  PUBG-C
//
//  Created by Bryce Bradshaw on 5/7/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

#import "WBBPlayerStats.h"

@implementation WBBPlayerStats

- (instancetype)initWithLongestKill:(NSDecimalNumber *)longestKill kills:(NSInteger)kills wins:(NSInteger)wins
{
    self = [super init];
    if (self)
    {
        _longestKill = longestKill;
        _kills = kills;
        _wins = wins;
    }
    return self;
}

@end

@implementation WBBPlayerStats (jsonConvertable)

-(instancetype)initWithDictionary:(NSDictionary *)topLevelDictionary
{
    NSDictionary *dataDictionary = topLevelDictionary[DATA];
    NSDictionary *attributesDictionary = dataDictionary[ATTRIBUTES];
    NSDictionary *GMSDictionary = attributesDictionary[GMS];
    NSDictionary *soloDictionary = GMSDictionary[SOLO];
    
    return [self initWithLongestKill:soloDictionary[LONGEST_KILL] kills:soloDictionary[KILLS] wins:soloDictionary[WINS]];
}

@end
