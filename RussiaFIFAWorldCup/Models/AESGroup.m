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
    return [self initWithGroupName:nil winner:nil runnerUp:nil andGroupMatches:nil];
}

- (instancetype)initWithGroupName:(NSString *)name winner:(NSString *)winner runnerUp:(NSString *)runnerUp andGroupMatches:(NSArray *)matches{
    self = [super init];
    
    if (self) {
        _name = name;
        _winner = winner;
        _runnerUp = runnerUp;
        _groupMatches = matches;
    }
    
    return self;
}

@end
