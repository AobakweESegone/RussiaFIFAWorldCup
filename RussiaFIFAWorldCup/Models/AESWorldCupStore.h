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

@interface AESWorldCupStore : NSObject

+ (instancetype)sharedStore;

@property (nonatomic, copy) NSDictionary *privateData;

- (void)fetchWorldCupData;

- (NSArray *)fetchTournmentGroups;
- (NSArray *)fetchTournmentKnockouts;
- (NSArray *)fetchStadiums; // all competition stadiums
- (NSArray *)fetchTeams;

- (void)teamsDataPerGroup:(AESGroup *)agroup;

- (NSArray *)fetchteamsDataPerGroup:(AESGroup *)agroup;

- (NSArray *)fetchMatchesPerGroup:(AESGroup *)agroup;

- (AESStadium *)fetchStadiumPerMatch:(AESGroupMatch *)match;

- (NSArray *)fetchTeamsData;

- (NSArray *)fetchGroupMatchesInGroup:(AESGroup *)group;

@end
