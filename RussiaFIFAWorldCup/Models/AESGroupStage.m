//
//  AESGroupStage.m
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/11.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import "AESGroupStage.h"

@implementation AESGroupStage

#pragma mark - initialization chain

- (instancetype)init{
    return [self initWithTournamentGroups:nil];
}

- (instancetype)initWithTournamentGroups:(NSDictionary *)groups{
    self = [super init];
    
    if (self) {
        _tournamentGroups = groups;
    }
    
    return self;
}

@end
