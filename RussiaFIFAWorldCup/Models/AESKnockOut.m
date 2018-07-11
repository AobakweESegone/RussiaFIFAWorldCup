//
//  AESKnockOut.m
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/11.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import "AESKnockOut.h"

@implementation AESKnockOut

#pragma mark - initialization chain

- (instancetype)initWithKnockoutName:(NSString *)name matches:(NSArray *)matches{
    self = [super initWithKnockOutRound:nil];
    
    if (self) {
        _knockoutName = name;
        _matches = matches;
    }
    
    return self;
}

- (instancetype)initWithKnockOutRound:(NSDictionary *)knockOutRound{
    
    return [self initWithKnockoutName:nil matches:nil];

}

- (instancetype)init{
    @throw [NSException exceptionWithName:@"Incorrect Initializer" reason:@"Use initWithKnockoutName:matches:" userInfo:nil];
    
    return nil;
}

@end
