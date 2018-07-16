//
//  AESGroup.h
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/11.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AESGroup : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, readonly) int winner;
@property (nonatomic, readonly) int runnerUp;
@property (nonatomic, strong, readonly) NSArray *groupMatches;

#pragma mark - initializer
- (instancetype)initWithGroupName:(NSString *)name winner:(int)winner runnerUp:(int)runnerUp andGroupMatches:(NSArray *)matches;

@end
