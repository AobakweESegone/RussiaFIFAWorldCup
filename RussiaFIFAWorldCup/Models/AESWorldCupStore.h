//
//  AESWorldCupStore.h
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/09.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AESGroup.h"

@interface AESWorldCupStore : NSObject

+ (instancetype)sharedStore;

@property (nonatomic, copy) NSDictionary *privateData;

- (void)fetchWorldCupData;

- (NSArray *)fetchTournmentGroups;
- (NSArray *)fetchStadiums; // all competition stadiums
- (NSArray *)fetchTeams;
//- (NSArray *)fetchKnockouts;

- (void)teamsDataPerGroup:(AESGroup *)agroup;

- (NSArray *)fetchteamsDataPerGroup:(AESGroup *)agroup;

- (NSArray *)fetchMatchesPerGroup:(AESGroup *)agroup;

- (NSArray *)fetchStadiumsPerGroup:(AESGroup *)agroup;

- (NSArray *)fetchTeamsData;

- (NSArray *)fetchGroupMatchesInGroup:(AESGroup *)group;

@end
