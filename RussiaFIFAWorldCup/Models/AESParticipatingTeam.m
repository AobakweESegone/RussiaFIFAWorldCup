//
//  AESParticipatingTeam.m
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/11.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import "AESParticipatingTeam.h"

@implementation AESParticipatingTeam

#pragma mark - initialization chain

- (instancetype)init{
    return [self initWithTeamID:0 name:nil fifaCode:nil flag:nil andEmojiString:nil];
}

- (id)initWithTeamID:(int)id name:(NSString *)name fifaCode:(NSString *)fifaCode flag:(UIImage *)flag andEmojiString:(NSString *)emojiString{
    self = [super init];
    
    if (self) {
        _teamID = id;
        _teamName = name;
        _fifaCode = fifaCode;
        _flag = flag;
        _emojiString = emojiString;
    }
    
    return self;
}

@end
