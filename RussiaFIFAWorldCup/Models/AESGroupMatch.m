//
//  AESGroupMatch.m
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/11.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import "AESGroupMatch.h"

@implementation AESGroupMatch

#pragma mark - initialization chain

- (id)initWithMatchName:(NSString *)matchName homeTeam:(int)homeTeam awayTeam:(int)awayTeam homeTeamGoals:(int)homeGoals awayTeamGoal:(int)awayGoals matchDate:(NSDate *)matchDate stadium:(AESStadium *)stadiumPlayed finished:(BOOL)isFinished andMatchDay:(int)matchDay{
    self = [super initWithGroupName:nil winner:nil runnerUp:nil andGroupMatches:nil];
    
    if (self) {
        _matchName = matchName;
        _homeTeam = homeTeam;
        _awayTeam = awayTeam;
        _homeTeamGoals = homeGoals;
        _awayTeamGoals = awayGoals;
        _matchDate = matchDate;
        _stadiumPlayed = stadiumPlayed;
        _isFinished = isFinished;
        _matchDay = matchDay;
    }
    
    return self;
}

- (instancetype)initWithGroupName:(NSString *)name winner:(NSString *)winner runnerUp:(NSString *)runnerUp andGroupMatches:(NSArray *)matches{
    return [self initWithMatchName:nil homeTeam:0 awayTeam:0 homeTeamGoals:0 awayTeamGoal:0 matchDate:nil stadium:nil finished:false andMatchDay:0];
}

- (instancetype)init{
    [NSException exceptionWithName:@"Incorrect Initializer" reason:@"use initWithMatchName:homeTeam:awayTeam:homeTeamGoals:awayTeamGoal:matchDate:stadium:finished:andMatchDay:" userInfo:nil];
    
    return nil;
}

@end
