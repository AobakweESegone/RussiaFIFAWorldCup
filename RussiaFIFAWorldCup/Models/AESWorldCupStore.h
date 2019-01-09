//
//  AESWorldCupStore.h
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/09.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AESGroup;
@class AESGroupMatch;
@class AESStadium;
@class AESKnockOut;
@class AESKnockoutMatch;

@interface AESWorldCupStore : NSObject

+ (instancetype)sharedStore;

@property (nonatomic, copy) NSDictionary *privateData;

- (void)fetchWorldCupData;
- (void)fetchLocalWorldCupData;

- (NSArray *)fetchTournmentGroups;
- (NSArray *)fetchTournmentKnockouts;
- (NSArray *)fetchStadiums; // all competition stadiums
- (NSArray *)fetchTeams;

- (void)teamsDataPerGroup:(AESGroup *)agroup;

- (NSArray *)fetchteamsDataPerGroup:(AESGroup *)agroup;

- (NSArray *)fetchMatchesPerGroup:(AESGroup *)agroup;

- (AESStadium *)fetchStadiumPerMatch:(AESGroupMatch *)match;
- (AESStadium *)fetchStadiumPerKnockoutMatch:(AESKnockoutMatch *)match;

- (NSArray *)fetchTeamsData;

- (NSArray *)fetchGroupMatchesInGroup:(AESGroup *)group;
- (NSArray *)fetchGroupMatchesInKnockoutGroup:(AESKnockOut *)group;

- (NSDate *)dateFromStringUTC:(NSString *)dateString;

@end
