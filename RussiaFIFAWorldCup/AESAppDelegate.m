//
//  AESAppDelegate.m
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/09.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import "AESAppDelegate.h"

@implementation AESAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // fetch data
    AESWorldCupStore *sharedStore = [AESWorldCupStore sharedStore];
    [sharedStore fetchWorldCupData];
    
    return YES;
}

@end
