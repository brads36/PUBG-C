//
//  WBBPlayerStats.h
//  PUBG-C
//
//  Created by Bryce Bradshaw on 5/7/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WBBPlayerStats : NSObject

#define DATA @"data"
#define ATTRIBUTES @"attributes"
#define GMS @"gameModeStats"
#define SOLO @"solo"
#define LONGEST_KILL @"longestKill"
#define KILLS @"kills"
#define WINS @"wins"

@property (nonatomic, readonly) NSDecimalNumber *longestKill;
@property (nonatomic, readonly) NSInteger kills;
@property (nonatomic, readonly) NSInteger wins;

- (instancetype)initWithLongestKill:(NSDecimalNumber *)longestKill kills:(NSInteger)kills wins:(NSInteger)wins;

@end

@interface WBBPlayerStats (jsonConvertable)
- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)topLevelDictionary;

@end

NS_ASSUME_NONNULL_END
