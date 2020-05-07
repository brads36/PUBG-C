//
//  WBBPlayer.m
//  PUBG-C
//
//  Created by Bryce Bradshaw on 5/7/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

#import "WBBPlayer.h"

@implementation WBBPlayer

- (instancetype)initWithPlayerID:(NSString *)playerID name:(NSString *)name stats:(WBBPlayerStats *)stats
{
    self = [super init];
    if (self)
    {
        _playerID = playerID;
        _name = name;
        _stats = stats;
    }
    return self;
}

@end

@implementation WBBPlayer (initWithoutStats)

- (instancetype)initWithName:(NSString *)name playerID:(NSString *)playerID
{
    self = [super init];
    if (self)
    {
        _name = name;
        _playerID = playerID;
    }
    return self;
}

@end

@implementation WBBPlayer (jsonConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)topLevelDictionary
{
    NSArray *dataArray = topLevelDictionary[DATA];
    NSDictionary *secondLevelDict = dataArray[0];
    NSDictionary *attributesDict = secondLevelDict[ATTRIBUTES];
    
    NSString *playerID = secondLevelDict[ID];
    playerID = [playerID stringByReplacingOccurrencesOfString:@"account." withString:@""];
    
    return [self initWithName:attributesDict[NAME] playerID:playerID];
}

@end
