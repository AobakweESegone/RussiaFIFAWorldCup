//
//  AESGroupsTableViewCell.h
//  RussiaWorldCup018
//
//  Created by Aobakwe Segone on 2018/06/24.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AESGroupsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *groupLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageThumbNail;


@property (weak, nonatomic) IBOutlet UILabel *iconOne;
@property (weak, nonatomic) IBOutlet UILabel *teamOne;
@property (weak, nonatomic) IBOutlet UILabel *iconTwo;
@property (weak, nonatomic) IBOutlet UILabel *teamTwo;
@property (weak, nonatomic) IBOutlet UILabel *iconThree;
@property (weak, nonatomic) IBOutlet UILabel *teamThree;
@property (weak, nonatomic) IBOutlet UILabel *iconFour;
@property (weak, nonatomic) IBOutlet UILabel *teamFour;

// games played
@property (weak, nonatomic) IBOutlet UILabel *teamOneGP;
@property (weak, nonatomic) IBOutlet UILabel *teamTwoGP;
@property (weak, nonatomic) IBOutlet UILabel *teamThreeGP;
@property (weak, nonatomic) IBOutlet UILabel *teamFourGP;

// points
@property (weak, nonatomic) IBOutlet UILabel *teamOnePts;
@property (weak, nonatomic) IBOutlet UILabel *teamTwoPts;
@property (weak, nonatomic) IBOutlet UILabel *teamThreePts;
@property (weak, nonatomic) IBOutlet UILabel *teamFourPts;
// wins
@property (weak, nonatomic) IBOutlet UILabel *teamOneWins;
@property (weak, nonatomic) IBOutlet UILabel *teamTwoWins;
@property (weak, nonatomic) IBOutlet UILabel *teamThreeWins;
@property (weak, nonatomic) IBOutlet UILabel *teamFourWins;

// loses
@property (weak, nonatomic) IBOutlet UILabel *teamOneLoses;
@property (weak, nonatomic) IBOutlet UILabel *teamTwoLoses;
@property (weak, nonatomic) IBOutlet UILabel *teamThreeLoses;
@property (weak, nonatomic) IBOutlet UILabel *teamFourLoses;

// draws
@property (weak, nonatomic) IBOutlet UILabel *teamOneDraws;
@property (weak, nonatomic) IBOutlet UILabel *teamTwoDraws;
@property (weak, nonatomic) IBOutlet UILabel *teamThreeDraws;
@property (weak, nonatomic) IBOutlet UILabel *teamFourDraws;

// goals against
@property (weak, nonatomic) IBOutlet UILabel *teamOneGA;
@property (weak, nonatomic) IBOutlet UILabel *teamTwoGA;
@property (weak, nonatomic) IBOutlet UILabel *teamThreeGA;
@property (weak, nonatomic) IBOutlet UILabel *teamFourGA;

// goals forward
@property (weak, nonatomic) IBOutlet UILabel *teamOneGF;
@property (weak, nonatomic) IBOutlet UILabel *teamTwoGF;
@property (weak, nonatomic) IBOutlet UILabel *teamThreeGF;
@property (weak, nonatomic) IBOutlet UILabel *teamFourGF;

// goal difference
@property (weak, nonatomic) IBOutlet UILabel *teamOneGD;
@property (weak, nonatomic) IBOutlet UILabel *teamTwoGD;
@property (weak, nonatomic) IBOutlet UILabel *teamThreeGD;
@property (weak, nonatomic) IBOutlet UILabel *teamFourGD;








@end
