//
//  AESStadium.h
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/11.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AESStadium : NSObject

@property (nonatomic, readonly) int stadiumID;
@property (nonatomic, strong, readonly) NSString *stadiumName;
@property (nonatomic, strong, readonly) NSString *stadiumCity;
@property (nonatomic, strong, readonly) UIImage *stadiumImage;

#pragma mark - initializer

- (instancetype)initWithStadiumID:(int)stadiumID stadiumName:(NSString *)name stadiumCity:(NSString *)city andStadiumImage:(UIImage *)image;

@end
