//
//  AESGroupDetailViewController.m
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/14.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import "AESGroupDetailViewController.h"
#import "AESGroupDetailTableViewCell.h"
#import "AESParticipatingTeam.h"
#import "AESGroup.h"
#import "AESWorldCupStore.h"
#import "AESGroupMatch.h"
#import "AESStadium.h"

@interface AESGroupDetailViewController ()

@property (weak, nonatomic) IBOutlet UITableView *groupDataTableView;

@property (weak, nonatomic) IBOutlet UILabel *groupName;
@property (weak, nonatomic) IBOutlet UILabel *groupWinner;
@property (weak, nonatomic) IBOutlet UILabel *groupRunnerUp;

@end

@implementation AESGroupDetailViewController{
    NSArray *groupMatches;
    
    NSString *winner;
    NSString *winnerEmojiString;
    NSString *runnerup;
    NSString *runnerUpmojiString;
    
    AESWorldCupStore *sharedStore;
    NSArray<AESStadium *> *stadiums;
}

#pragma mark - initializer(s)

#pragma mark - view life cycle

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // register the cell with the table view
    UINib *nib = [UINib nibWithNibName:@"AESGroupDetailTableViewCell" bundle:nil];
    [self.groupDataTableView registerNib:nib forCellReuseIdentifier:@"AESGroupDetailTableViewCell"];
    
    // get group details
    [self groupDetails:self.group];
    sharedStore = [AESWorldCupStore sharedStore];
    
    groupMatches = [sharedStore fetchGroupMatchesInGroup:self.group];
    stadiums = [sharedStore fetchStadiums];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - actions

- (IBAction)groupStages:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)groupDetails:(AESGroup *)group{
    AESWorldCupStore *sharedStore = [AESWorldCupStore sharedStore];
    
    NSArray *teams = [sharedStore fetchTeams];
    
    int winnerID = self.group.winner;
    int runnerUpID = self.group.runnerUp;
    
    for (AESParticipatingTeam *team in teams) {
        if (winnerID == team.teamID) {
            winner = team.teamName;
            winnerEmojiString = team.emojiString;
        }else if (runnerUpID == team.teamID){
            runnerup = team.teamName;
            runnerUpmojiString = team.emojiString;
        }
    }
    
    self.groupName.text = self.group.name;
    self.groupWinner.text = [[[NSString stringWithString:winnerEmojiString] stringByAppendingString:@" "] stringByAppendingString:winner];
    self.groupRunnerUp.text = [[[NSString stringWithString:runnerUpmojiString] stringByAppendingString:@" "] stringByAppendingString:runnerup];;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - table view datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return groupMatches.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    AESGroupDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AESGroupDetailTableViewCell" forIndexPath:indexPath];
    
    for (int i = 0; i < groupMatches.count; i++){
        AESGroupMatch *singleMatch = groupMatches[i];
        
        NSArray *teams = [sharedStore fetchTeams];
        AESStadium *stadium = [sharedStore fetchStadiumPerMatch:singleMatch];
        
        if (i == indexPath.row) {
            for (AESParticipatingTeam *team in teams) {
                if (singleMatch.homeTeam == team.teamID) {
                    cell.homeTeam.text = [[[NSString stringWithString:team.emojiString] stringByAppendingString:@" "] stringByAppendingString:team.teamName];
                    cell.homeTeamScore.text = [NSString stringWithFormat:@"%d", singleMatch.homeTeamGoals];
                }else if (singleMatch.awayTeam == team.teamID){
                    cell.awayTeam.text = [[[NSString stringWithString:team.emojiString] stringByAppendingString:@" "] stringByAppendingString:team.teamName];
                    cell.awayTeamScore.text = [NSString stringWithFormat:@"%d", singleMatch.awayTeamGoals];
                }
            }
            cell.matchNumber.text = [NSString stringWithFormat:@"%@", singleMatch.matchName];
            cell.matchDay.text = [NSString stringWithFormat:@"%d", singleMatch.matchDay];
            cell.matchDate.text = [NSString stringWithFormat:@"%@", singleMatch.matchDate];
            [cell.stadiumUsed setTitle:stadium.stadiumName forState:UIControlStateNormal];
        }
        
        
    }
    
    
    return  cell;
}

@end
