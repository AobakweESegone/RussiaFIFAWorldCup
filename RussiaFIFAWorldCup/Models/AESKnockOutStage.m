//
//  AESKnockOutStage.m
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/11.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import "AESKnockOutStage.h"

@implementation AESKnockOutStage

# pragma mark - initialization chain

- (instancetype)initWithKnockOutRound:(NSDictionary *)knockOutRound{
    self = [super init];
    
    if (self) {
        _knockOutRound = knockOutRound;
    }
    
    return self;
}

- (instancetype)init{
    return [self initWithKnockOutRound:nil];
}


@end
