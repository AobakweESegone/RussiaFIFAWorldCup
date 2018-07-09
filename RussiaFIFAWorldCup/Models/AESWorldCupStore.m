//
//  AESWorldCupStore.m
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/09.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import "AESWorldCupStore.h"

@implementation AESWorldCupStore

#pragma mark - initializers

+ (instancetype)sharedStore{
    static AESWorldCupStore *sharedStore = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedStore = [[self alloc] initPrivate];
    });
    
    return sharedStore;
}

- (instancetype)initPrivate{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

- (instancetype)init{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[AESWorldCupStore sharedStore]" userInfo:nil];
    
    return nil;
}

@end
