//
//  AESStadium.m
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/11.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import "AESStadium.h"

@implementation AESStadium

#pragma mark - initialization chain

- (instancetype)init{
    return [self initWithStadiumID:0 stadiumName:nil stadiumCity:nil andStadiumImage:nil];
}

- (instancetype)initWithStadiumID:(int)stadiumID stadiumName:(NSString *)name stadiumCity:(NSString *)city andStadiumImage:(UIImage *)image{
    self = [super init];
    
    if (self) {
        _stadiumID = stadiumID;
        _stadiumName = name;
        _stadiumCity = city;
        _stadiumImage = image;
    }
    
    return self;
}

@end
