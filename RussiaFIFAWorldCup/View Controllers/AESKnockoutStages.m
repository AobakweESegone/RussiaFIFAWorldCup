//
//  AESKnockoutStages.m
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/08/01.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import "AESKnockoutStages.h"
#import "AESWorldCupStore.h"
#import "AESKnockoutTableViewCell.h"
#import "AESKnockOut.h"
#import "AESKnockoutDetailViewController.h"

@interface AESKnockoutStages ()

@end

@implementation AESKnockoutStages{
    AESWorldCupStore *sharedStore;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    sharedStore = [AESWorldCupStore sharedStore];
    
    UINib *nib = [UINib nibWithNibName:@"AESKnockoutTableViewCell" bundle:nil]; // nil forces the compiler to look in the main bundle
    [self.tableView registerNib:nib forCellReuseIdentifier:@"AESKnockoutTableViewCell"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//- (void)viewDidLayoutSubviews{
//    [super viewDidLayoutSubviews];
//    
//    // resize the table view to fit its content... run the code in the main thread since this alters the UI
//    dispatch_async(dispatch_get_main_queue(), ^{
//        CGRect frame = self.tableView.frame;
//        frame.size.height = self.tableView.contentSize.height;
//        self.tableView.frame = frame;
//    });
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return sharedStore.fetchTournmentKnockouts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AESKnockoutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AESKnockoutTableViewCell" forIndexPath:indexPath];

    AESKnockOut *group = sharedStore.fetchTournmentKnockouts[indexPath.row];
    cell.knockoutStage.text = group.knockoutName;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AESKnockOut *group = sharedStore.fetchTournmentKnockouts[indexPath.row];
    
    AESKnockoutDetailViewController *groupDetail = [[AESKnockoutDetailViewController alloc] initWithNibName:@"AESKnockoutDetailViewController" bundle:nil];
    groupDetail.group = group;
    
    [self.navigationController pushViewController:groupDetail animated:YES];
    
    //[self presentViewController:groupDetail animated:YES completion:nil];
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
