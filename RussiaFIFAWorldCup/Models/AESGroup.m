//
//  AESGroup.m
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/11.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import "AESGroup.h"

@implementation AESGroup

- (instancetype)init{
    @throw [NSException exceptionWithName:@"Incorrect Initialzer" reason:@"Use initWithGroupName:winner:runnerUp:andGroupMatches:" userInfo:nil];
    
    return nil;
}

- (instancetype)initWithTournamentGroups:(NSDictionary *)groups{
    return [self initWithGroupName:nil winner:nil runnerUp:nil andGroupMatches:nil];
}

- (instancetype)initWithGroupName:(NSString *)name winner:(NSString *)winner runnerUp:(NSString *)runnerUp andGroupMatches:(NSArray *)matches{
    self = [super initWithTournamentGroups:nil];
    
    if (self) {
        _name = name;
        _winner = winner;
        _runnerUp = runnerUp;
        _groupMatches = matches;
    }
    
    return self;
}

@end
