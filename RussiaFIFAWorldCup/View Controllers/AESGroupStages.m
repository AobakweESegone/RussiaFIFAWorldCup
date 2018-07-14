//
//  AESGroupStages.m
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/09.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import "AESGroupStages.h"
#import "AESWorldCupStore.h"
#import "AESGroupsTableViewCell.h"
#import "AESGroup.h"
#import "AESGroupDetailViewController.h"

@interface AESGroupStages ()

@end

@implementation AESGroupStages{
    AESWorldCupStore *sharedStore;
}

#pragma mark - initializers

- (instancetype)initWithStyle:(UITableViewStyle)style{
    
    if (self =  [super initWithStyle:style]) {
    }
    return self;
}

#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    sharedStore = [AESWorldCupStore sharedStore];
    
    UINib *nib = [UINib nibWithNibName:@"AESGroupsTableViewCell" bundle:nil]; // nil forces the compiler to look in the main bundle
    [self.tableView registerNib:nib forCellReuseIdentifier:@"AESGroupsTableViewCell"];
    
    //COMMEMNT OUT FOR NETWORK CALL
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"No World Cup Data" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"Tournament Groups Generated" object:nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - actions



- (void)receiveNotification:(NSNotification *)notification{
    if ([notification.name isEqualToString:@"No World Cup Data"]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"No World Cup Data" message:@"Encounted problem retrieving the world cup data. Please try again later." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        
        // present the controller
        [self presentViewController:alert animated:YES completion:nil];
    }else if ([notification.name isEqualToString:@"Tournament Groups Generated"]){
        // reload the table view
        [self.tableView reloadData];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return sharedStore.fetchTournmentGroups.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AESGroupsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AESGroupsTableViewCell" forIndexPath:indexPath];
    
    // create group per cell
    AESGroup *group = sharedStore.fetchTournmentGroups[indexPath.row];
    // find teams data per group
    [sharedStore teamsDataPerGroup:group];
    // fetch teams table data
    NSArray *teamData = [sharedStore fetchTeamsData];
    
    // configure each cell
    cell.groupLabel.text = group.name;
    for (int i = 0; i < teamData.count; i++) {
        
        if (i == 0) {
            cell.iconOne.text = [teamData[i] objectForKey:@"emojiString"];
            cell.teamOne.text = [teamData[i] objectForKey:@"fifaCode"];
            NSNumber *gp = [teamData[i] objectForKey:@"teamGP"];
            cell.teamOneGP.text = [NSString stringWithFormat:@"%ld",(long)gp.intValue];
            NSNumber *pts = [teamData[i] objectForKey:@"teamPts"];
            cell.teamOnePts.text = [NSString stringWithFormat:@"%ld",(long)pts.intValue];
            NSNumber *w = [teamData[i] objectForKey:@"teamW"];
            cell.teamOneWins.text = [NSString stringWithFormat:@"%ld",(long)w.intValue];
            NSNumber *l = [teamData[i] objectForKey:@"teamL"];
            cell.teamOneLoses.text = [NSString stringWithFormat:@"%ld",(long)l.intValue];
            NSNumber *d = [teamData[i] objectForKey:@"teamD"];
            cell.teamOneDraws.text = [NSString stringWithFormat:@"%ld",(long)d.intValue];
            NSNumber *ga = [teamData[i] objectForKey:@"teamGA"];
            cell.teamOneGA.text = [NSString stringWithFormat:@"%ld",(long)ga.integerValue];
            NSNumber *gf = [teamData[i] objectForKey:@"teamGF"];
            cell.teamOneGF.text = [NSString stringWithFormat:@"%ld",(long)gf.intValue];
            NSNumber *gd = [teamData[i] objectForKey:@"teamGD"];
            cell.teamOneGD.text = [NSString stringWithFormat:@"%ld",(long)gd.intValue];
        }else if (i == 1){
            cell.teamTwo.text = [[[teamData[i] objectForKey:@"emojiString"] stringByAppendingString:[NSString stringWithFormat:@" "]] stringByAppendingString:[teamData[i] objectForKey:@"fifaCode"]];
            NSNumber *gp = [teamData[i] objectForKey:@"teamGP"];
            cell.teamTwoGP.text = [NSString stringWithFormat:@"%ld",(long)gp.intValue];
            NSNumber *pts = [teamData[i] objectForKey:@"teamPts"];
            cell.teamTwoPts.text = [NSString stringWithFormat:@"%ld",(long)pts.intValue];
            NSNumber *w = [teamData[i] objectForKey:@"teamW"];
            cell.teamTwoWins.text = [NSString stringWithFormat:@"%ld",(long)w.intValue];
            NSNumber *l = [teamData[i] objectForKey:@"teamL"];
            cell.teamTwoLoses.text = [NSString stringWithFormat:@"%ld",(long)l.intValue];
            NSNumber *d = [teamData[i] objectForKey:@"teamD"];
            cell.teamTwoDraws.text = [NSString stringWithFormat:@"%ld",(long)d.intValue];
            NSNumber *ga = [teamData[i] objectForKey:@"teamGA"];
            cell.teamTwoGA.text = [NSString stringWithFormat:@"%ld",(long)ga.intValue];
            NSNumber *gf = [teamData[i] objectForKey:@"teamGF"];
            cell.teamTwoGF.text = [NSString stringWithFormat:@"%ld",(long)gf.intValue];
            NSNumber *gd = [teamData[i] objectForKey:@"teamGD"];
            cell.teamTwoGD.text = [NSString stringWithFormat:@"%ld",(long)gd.intValue];
        }else if (i == 2){
            cell.teamThree.text = [[[teamData[i] objectForKey:@"emojiString"] stringByAppendingString:[NSString stringWithFormat:@" "]] stringByAppendingString:[teamData[i] objectForKey:@"fifaCode"]];
            NSNumber *gp = [teamData[i] objectForKey:@"teamGP"];
            cell.teamThreeGP.text = [NSString stringWithFormat:@"%ld",(long)gp.intValue];
            NSNumber *pts = [teamData[i] objectForKey:@"teamPts"];
            cell.teamThreePts.text = [NSString stringWithFormat:@"%ld",(long)pts.intValue];
            NSNumber *w = [teamData[i] objectForKey:@"teamW"];
            cell.teamThreeWins.text = [NSString stringWithFormat:@"%ld",(long)w.intValue];
            NSNumber *l = [teamData[i] objectForKey:@"teamL"];
            cell.teamThreeLoses.text = [NSString stringWithFormat:@"%ld",(long)l.intValue];
            NSNumber *d = [teamData[i] objectForKey:@"teamD"];
            cell.teamThreeDraws.text = [NSString stringWithFormat:@"%ld",(long)d.intValue];
            NSNumber *ga = [teamData[i] objectForKey:@"teamGA"];
            cell.teamThreeGA.text = [NSString stringWithFormat:@"%ld",(long)ga.intValue];
            NSNumber *gf = [teamData[i] objectForKey:@"teamGF"];
            cell.teamThreeGF.text = [NSString stringWithFormat:@"%ld",(long)gf.intValue];
            NSNumber *gd = [teamData[i] objectForKey:@"teamGD"];
            cell.teamThreeGD.text = [NSString stringWithFormat:@"%ld",(long)gd.intValue];
        }else if (i == 3){
            cell.teamFour.text = [[[teamData[i] objectForKey:@"emojiString"] stringByAppendingString:[NSString stringWithFormat:@" "]] stringByAppendingString:[teamData[i] objectForKey:@"fifaCode"]];
            NSNumber *gp = [teamData[i] objectForKey:@"teamGP"];
            cell.teamFourGP.text = [NSString stringWithFormat:@"%ld",(long)gp.intValue];
            NSNumber *pts = [teamData[i] objectForKey:@"teamPts"];
            cell.teamFourPts.text = [NSString stringWithFormat:@"%ld",(long)pts.intValue];
            NSNumber *w = [teamData[i] objectForKey:@"teamW"];
            cell.teamFourWins.text = [NSString stringWithFormat:@"%ld",(long)w.intValue];
            NSNumber *l = [teamData[i] objectForKey:@"teamL"];
            cell.teamFourLoses.text = [NSString stringWithFormat:@"%ld",(long)l.intValue];
            NSNumber *d = [teamData[i] objectForKey:@"teamD"];
            cell.teamFourDraws.text = [NSString stringWithFormat:@"%ld",(long)d.intValue];
            NSNumber *ga = [teamData[i] objectForKey:@"teamGA"];
            cell.teamFourGA.text = [NSString stringWithFormat:@"%ld",(long)ga.intValue];
            NSNumber *gf = [teamData[i] objectForKey:@"teamGF"];
            cell.teamFourGF.text = [NSString stringWithFormat:@"%ld",(long)gf.intValue];
            NSNumber *gd = [teamData[i] objectForKey:@"teamGD"];
            cell.teamFourGD.text = [NSString stringWithFormat:@"%ld",(long)gd.intValue];
        }
        
        
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AESGroup *group = sharedStore.fetchTournmentGroups[indexPath.row];
    
    AESGroupDetailViewController *groupDetail = [[AESGroupDetailViewController alloc] initWithNibName:@"AESGroupDetailViewController" bundle:nil];
    groupDetail.groupName.text = group.name;
    
    [self presentViewController:groupDetail animated:YES completion:nil];
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
