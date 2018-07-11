//
//  AESKnockOutStage.h
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/11.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AESKnockOutStage : NSObject

@property (nonatomic, strong) NSDictionary *knockOutRound;

#pragma mark - initializer

- (instancetype)initWithKnockOutRound:(NSDictionary *)knockOutRound;

@end
