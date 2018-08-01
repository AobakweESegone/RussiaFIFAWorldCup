//
//  AESKnockoutMatch.m
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/11.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import "AESKnockoutMatch.h"

@implementation AESKnockoutMatch

#pragma mark - initialization chain

- (instancetype)initWithKnockoutMatchName:(NSString *)matchName homeTeam:(int)homeTeam awayTeam:(int)awayTeam homeTeamGoals:(int)homeGoals awayTeamGoal:(int)awayGoals homePenaltyGoals:(int)homeTeamPenaltyGoals awayPenaltyGoals:(int)awayTeamPenaltyGoals matchDate:(NSDate *)matchDate stadium:(int)stadiumPlayed winner:(int)winner finished:(BOOL)isFinished andMatchDay:(int)matchDay{
    self = [super initWithKnockoutName:nil matches:nil];
    
    if (self) {
        _matchName = matchName;
        _homeTeam = homeTeam;
        _awayTeam = awayTeam;
        _homeTeamGoals = homeGoals;
        _awayTeamGoals = awayGoals;
        _homeTeamPenaltyGoals = homeTeamPenaltyGoals;
        _awayTeamPenaltyGoals = awayTeamPenaltyGoals;
        _matchDate = matchDate;
        _stadiumPlayed = stadiumPlayed;
        _winner = winner;
        _isFinished = isFinished;
        _matchDay = matchDay;
    }
    
    return self;
}

- (instancetype)initWithKnockOutRoundDict:(NSDictionary *)knockOutRoundDict{
    return [self initWithKnockoutMatchName:nil homeTeam:0 awayTeam:0 homeTeamGoals:0 awayTeamGoal:0 homePenaltyGoals:0 awayPenaltyGoals:0 matchDate:nil stadium:0 winner:0 finished:false andMatchDay:0];
}

- (instancetype)init{
    @throw [NSException exceptionWithName:@"Incorrect initializer" reason:@"Use - initWithKnockoutMatchName:homeTeam:awayTeam:homeTeamGoals:awayTeamGoal:homePenaltyGoals:awayPenaltyGoals:matchDate:stadium:winner:finished:andMatchDay:" userInfo:nil];
    
    return nil;
}

@end
