//
//  AESKnockoutDetailTableViewCell.h
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/08/01.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AESKnockoutDetailTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *homeTeam;
@property (weak, nonatomic) IBOutlet UILabel *awayTeam;

@property (weak, nonatomic) IBOutlet UILabel *homeTeamScore;
@property (weak, nonatomic) IBOutlet UILabel *homeTeamPenalty;
@property (weak, nonatomic) IBOutlet UILabel *awayTeamScore;
@property (weak, nonatomic) IBOutlet UILabel *awayTeamPenalty;

@property (weak, nonatomic) IBOutlet UILabel *matchNumber;
@property (weak, nonatomic) IBOutlet UILabel *matchDay;

@property (weak, nonatomic) IBOutlet UILabel *stadiumUsed;

@property (weak, nonatomic) IBOutlet UILabel *matchDate;
@property (weak, nonatomic) IBOutlet UILabel *matchPlayTime;


@end
