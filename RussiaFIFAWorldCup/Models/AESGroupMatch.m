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

- (id)initWithMatchName:(NSString *)matchName homeTeam:(int)homeTeam awayTeam:(int)awayTeam homeTeamGoals:(int)homeGoals awayTeamGoal:(int)awayGoals matchDate:(NSDate *)matchDate stadium:(int)stadiumPlayed finished:(BOOL)isFinished andMatchDay:(int)matchDay{
    self = [super initWithGroupName:nil winner:0 runnerUp:0 andGroupMatches:nil];
    
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

- (instancetype)initWithGroupName:(NSString *)name winner:(int)winner runnerUp:(int)runnerUp andGroupMatches:(NSArray *)matches{
    return [self initWithMatchName:nil homeTeam:0 awayTeam:0 homeTeamGoals:0 awayTeamGoal:0 matchDate:nil stadium:0 finished:false andMatchDay:0];
}

- (instancetype)init{
    [NSException exceptionWithName:@"Incorrect Initializer" reason:@"use initWithMatchName:homeTeam:awayTeam:homeTeamGoals:awayTeamGoal:matchDate:stadium:finished:andMatchDay:" userInfo:nil];
    
    return nil;
}

@end
