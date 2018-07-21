//
//  AESGroupMatch.h
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/11.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import "AESGroup.h"

@interface AESGroupMatch : AESGroup

@property (nonatomic, strong, readonly) NSString *matchName;
@property (nonatomic, readonly) int homeTeam;
@property (nonatomic, readonly) int awayTeam;
@property (nonatomic, readonly) int homeTeamGoals;
@property (nonatomic, readonly) int awayTeamGoals;
@property (nonatomic, strong, readonly) NSDate *matchDate;
@property (nonatomic, readonly) int stadiumPlayed;
@property (nonatomic, readonly) BOOL isFinished;
@property (nonatomic, readonly) int matchDay;

#pragma mark - initializer

- initWithMatchName:(NSString *)matchName homeTeam:(int)homeTeam awayTeam:(int)awayTeam homeTeamGoals:(int)homeGoals awayTeamGoal:(int)awayGoals matchDate:(NSDate *)matchDate stadium:(int)stadiumPlayed finished:(BOOL)isFinished andMatchDay:(int)matchDay;

@end
