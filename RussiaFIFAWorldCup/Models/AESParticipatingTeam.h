//
//  AESParticipatingTeam.h
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/11.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AESParticipatingTeam : NSObject

@property (nonatomic, readonly) int teamID;
@property (nonatomic, strong, readonly) NSString *teamName;
@property (nonatomic, strong, readonly) NSString *fifaCode;
@property (nonatomic, strong, readonly) UIImage *flag;
@property (nonatomic, strong, readonly) NSString *emojiString;

#pragma mark - initializer

- initWithTeamID:(int)id name:(NSString *)name fifaCode:(NSString *)fifaCode flag:(UIImage *)flag andEmojiString:(NSString *)emojiString;

@end
