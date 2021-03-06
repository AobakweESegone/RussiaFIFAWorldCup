//
//  AESKnockoutDetailViewController.m
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/08/01.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import "AESKnockoutDetailViewController.h"
#import "AESKnockoutDetailTableViewCell.h"
#import "AESWorldCupStore.h"
#import "AESStadium.h"
#import "AESKnockoutMatch.h"
#import "AESParticipatingTeam.h"

@interface AESKnockoutDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *groupName;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableHeightConstraint;


@property (weak, nonatomic) IBOutlet UITableView *knockoutDataTableView;

@end

@implementation AESKnockoutDetailViewController{
    NSArray *groupMatches;
    
    AESWorldCupStore *sharedStore;
    NSArray<AESStadium *> *stadiums;
}

#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"AESKnockoutDetailTableViewCell" bundle:nil];
    [self.knockoutDataTableView registerNib:nib forCellReuseIdentifier:@"AESKnockoutDetailTableViewCell"];
    
    self.groupName.text = self.group.knockoutName;
    sharedStore = [AESWorldCupStore sharedStore];
    
    groupMatches = [sharedStore fetchGroupMatchesInKnockoutGroup:self.group];
    stadiums = [sharedStore fetchStadiums];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)viewDidLayoutSubviews{
//    [super viewDidLayoutSubviews];
//
//    self.tableHeightConstraint.constant = self.knockoutDataTableView.contentSize.height;
//    [self.knockoutDataTableView needsUpdateConstraints];
//
//}

//- (void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    
//    // run the code in the main thread since the interface is been altered
//    dispatch_async(dispatch_get_main_queue(), ^{
//        CGRect frame = self.knockoutDataTableView.frame;
//        frame.size.height = self.knockoutDataTableView.contentSize.height;
//        self.knockoutDataTableView.frame = frame;
//    });
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - actions

- (IBAction)knockoutStages:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - table view datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return groupMatches.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AESKnockoutDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AESKnockoutDetailTableViewCell" forIndexPath:indexPath];
    
    for (int i = 0; i < groupMatches.count; i++){
        AESKnockoutMatch *singleMatch = groupMatches[i];
        
        NSArray *teams = [sharedStore fetchTeams];
        AESStadium *stadium = [sharedStore fetchStadiumPerKnockoutMatch:singleMatch];
        
        if (i == indexPath.row) {
            for (AESParticipatingTeam *team in teams) {
                if (singleMatch.homeTeam == team.teamID) {
                    cell.homeTeam.text = [[[NSString stringWithString:team.emojiString] stringByAppendingString:@" "] stringByAppendingString:team.teamName];
                    
                    // penalty score of 100 => no penalties
                    if (singleMatch.homeTeamPenaltyGoals == 100 || singleMatch.awayTeamPenaltyGoals == 100) {
                        // hide the penalty label
                        cell.homeTeamPenalty.hidden = YES;
                        cell.homeTeamScore.text = [NSString stringWithFormat:@"%d", singleMatch.homeTeamGoals];
                    }else{
                        cell.homeTeamScore.text = [[[NSString stringWithFormat:@"%d", singleMatch.homeTeamGoals] stringByAppendingString:@" "] stringByAppendingString:[NSString stringWithFormat:@"(%d)", singleMatch.homeTeamPenaltyGoals]];
                        //cell.homeTeamPenalty.text = [NSString stringWithFormat:@"(%d)", singleMatch.homeTeamPenaltyGoals];
                    }
                    
                }else if (singleMatch.awayTeam == team.teamID){
                    cell.awayTeam.text = [[[NSString stringWithString:team.emojiString] stringByAppendingString:@" "] stringByAppendingString:team.teamName];
                    
                    // penalty score of 100 => no penalties
                    if (singleMatch.homeTeamPenaltyGoals == 100 || singleMatch.awayTeamPenaltyGoals == 100) {
                        // hide the penalty label
                        cell.awayTeamPenalty.hidden = YES;
                        cell.awayTeamScore.text = [NSString stringWithFormat:@"%d", singleMatch.awayTeamGoals];
                    }else{
                        cell.awayTeamScore.text = [[[NSString stringWithFormat:@"%d", singleMatch.awayTeamGoals] stringByAppendingString:@" "] stringByAppendingString:[NSString stringWithFormat:@"(%d)", singleMatch.awayTeamPenaltyGoals]];
                        //cell.awayTeamPenalty.text = [NSString stringWithFormat:@"(%d)", singleMatch.homeTeamPenaltyGoals];
                    }
                }
            }
            cell.matchNumber.text = [NSString stringWithFormat:@"%@", singleMatch.matchName];
            
            NSString *matchDate = [NSString stringWithFormat:@"%@", singleMatch.matchDate];
            NSString * dt = [sharedStore dateFromString:matchDate];
            
            cell.matchDate.text = [NSString stringWithFormat:@"%@", dt];
            cell.stadiumUsed.text = [NSString stringWithFormat:@"%@", stadium.stadiumName];
        }
    }
    
    return cell;
}

@end
