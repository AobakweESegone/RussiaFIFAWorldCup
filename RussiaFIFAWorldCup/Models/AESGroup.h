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
@property (nonatomic, strong, readonly) NSString *winner;
@property (nonatomic, strong, readonly) NSString *runnerUp;
@property (nonatomic, strong, readonly) NSArray *groupMatches;

#pragma mark - initializer
- (instancetype)initWithGroupName:(NSString *)name winner:(NSString *)winner runnerUp:(NSString *)runnerUp andGroupMatches:(NSArray *)matches;

@end
