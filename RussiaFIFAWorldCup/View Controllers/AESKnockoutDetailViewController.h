//
//  AESKnockoutDetailViewController.h
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/08/01.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AESKnockOut.h"

@interface AESKnockoutDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) AESKnockOut *group;

@end
