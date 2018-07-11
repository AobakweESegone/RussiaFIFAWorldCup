//
//  AESKnockOut.h
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/11.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AESKnockOut : NSObject

@property (nonatomic, strong, readonly) NSString *knockoutName;
@property (nonatomic, strong, readonly) NSArray *matches;

#pragma mark - initializer

- (instancetype)initWithKnockoutName:(NSString *)name matches:(NSArray *)matches;

@end
