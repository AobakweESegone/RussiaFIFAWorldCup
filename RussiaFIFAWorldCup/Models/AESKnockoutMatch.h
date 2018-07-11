//
//  AESKnockoutMatch.h
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/11.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import "AESKnockOut.h"
#import "AESStadium.h"

@interface AESKnockoutMatch : AESKnockOut

@property (nonatomic, strong, readonly) NSString *matchName;
@property (nonatomic, readonly) int homeTeam;
@property (nonatomic, readonly) int awayTeam;
@property (nonatomic, readonly) int homeTeamGoals;
@property (nonatomic, readonly) int awayTeamGoals;
@property (nonatomic, readonly) int homeTeamPenaltyGoals;
@property (nonatomic, readonly) int awayTeamPenaltyGoals;
@property (nonatomic, strong, readonly) NSDate *matchDate;
@property (nonatomic, strong, readonly) AESStadium *stadiumPlayed;
@property (nonatomic, readonly) int winner;
@property (nonatomic, readonly) BOOL isFinished;
@property (nonatomic, readonly) int matchDay;

#pragma mark - initializer

- (instancetype)initWithKnockoutMatchName:(NSString *)matchName homeTeam:(int)homeTeam awayTeam:(int)awayTeam homeTeamGoals:(int)homeGoals awayTeamGoal:(int)awayGoals homePenaltyGoals:(int)homeTeamPenaltyGoals awayPenaltyGoals:(int)awayTeamPenaltyGoals matchDate:(NSDate *)matchDate stadium:(AESStadium *)stadiumPlayed winner:(int)winner finished:(BOOL)isFinished andMatchDay:(int)matchDay;

@end
