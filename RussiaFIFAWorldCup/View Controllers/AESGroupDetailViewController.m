//
//  AESGroupDetailViewController.m
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/14.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import "AESGroupDetailViewController.h"
#import "AESGroupDetailTableViewCell.h"

@interface AESGroupDetailViewController ()

@property (weak, nonatomic) IBOutlet UITableView *groupDataTableView;

@end

@implementation AESGroupDetailViewController

#pragma mark - initializer(s)

#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // register the cell with the table view
    UINib *nib = [UINib nibWithNibName:@"AESGroupDetailTableViewCell" bundle:nil];
    [self.groupDataTableView registerNib:nib forCellReuseIdentifier:@"AESGroupDetailTableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - actions

- (IBAction)groupStages:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
    return 6;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    AESGroupDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AESGroupDetailTableViewCell" forIndexPath:indexPath];
    
    return  cell;
}

@end
