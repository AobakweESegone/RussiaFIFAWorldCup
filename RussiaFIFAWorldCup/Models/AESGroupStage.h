//
//  AESGroupStage.h
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/11.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AESGroupStage : NSObject

@property (nonatomic, strong) NSDictionary *tournamentGroups;

#pragma mark - initializer

- (instancetype)initWithTournamentGroups:(NSDictionary *)groups;

@end
