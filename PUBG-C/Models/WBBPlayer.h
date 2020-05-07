//
//  WBBPlayer.h
//  PUBG-C
//
//  Created by Bryce Bradshaw on 5/7/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBBPlayerStats.h"

NS_ASSUME_NONNULL_BEGIN

@interface WBBPlayer : NSObject

#define ID @"id"
#define NAME @"name"

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *playerID;
@property (nonatomic, readonly) WBBPlayerStats *stats;

- (instancetype)initWithPlayerID:(NSString *)playerID
                            name:(NSString *)name
                           stats:(WBBPlayerStats *)stats;
@end

@interface WBBPlayer (initWithoutStats)
- (instancetype)initWithName:(NSString *)name
                    playerID:(NSString *)playerID;
@end

@interface WBBPlayer (jsonConvertable)
- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)topLevelDictionary;

@end

NS_ASSUME_NONNULL_END
