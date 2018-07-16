//
//  AESGroupDetailViewController.h
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/14.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AESGroup;

@interface AESGroupDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) AESGroup *group;
@property (strong, nonatomic) NSArray <AESGroup *> *matchesPerGroup;

@end
