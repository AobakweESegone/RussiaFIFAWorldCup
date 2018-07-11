//
//  AESWorldCupStore.m
//  RussiaFIFAWorldCup
//
//  Created by Aobakwe Segone on 2018/07/09.
//  Copyright © 2018 aobakwesegone. All rights reserved.
//

#import "AESWorldCupStore.h"
#import "AESGroup.h"
#import "AESStadium.h"
#import "AESParticipatingTeam.h"
#import "AESGroupMatch.h"

NSString * const HOST_URL = @"https://raw.githubusercontent.com/lsv/fifa-worldcup-2018/master/data.json";

@interface AESWorldCupStore()

@property (nonatomic, strong) NSURLSession *session;

@property (nonatomic, copy) NSMutableDictionary *prvtData;
@property (nonatomic, copy) NSMutableArray *privateStadiums;
@property (nonatomic, copy) NSMutableArray *privateTeams;
@property (nonatomic, copy) NSMutableDictionary *privateGroups;
@property (nonatomic, copy) NSMutableArray *privateGroupMatches;
@property (nonatomic, copy) NSMutableDictionary *privateKnockouts;
@property (nonatomic, copy) NSMutableArray *privateKnockoutMatches;

@end

@implementation AESWorldCupStore{
    NSMutableArray *tournamentGroups;
    NSMutableArray *tournamentStadiums;
    NSMutableArray *participatingTeams;
    NSMutableArray *teamsPerGroup;
    NSMutableArray *matchesPerGroup;
    NSMutableArray *stadiumsPerGroup;
    NSArray *teamsData;
}

#pragma mark - initializers

+ (instancetype)sharedStore{
    static AESWorldCupStore *sharedStore = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedStore = [[self alloc] initPrivate];
    });
    
    return sharedStore;
}

- (instancetype)initPrivate{
    self = [super init];
    
    if (self) {
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:nil];
        
        _prvtData = [[NSMutableDictionary alloc] init];
        _privateStadiums = [[NSMutableArray alloc] init];
        _privateTeams = [[NSMutableArray alloc] init];
        _privateGroups = [[NSMutableDictionary alloc] init];
        _privateGroupMatches = [[NSMutableArray alloc] init];
        _privateGroupMatches = [[NSMutableArray alloc] init];
        _privateKnockouts = [[NSMutableDictionary alloc] init];
        _privateKnockoutMatches = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (instancetype)init{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[AESWorldCupStore sharedStore]" userInfo:nil];
    
    return nil;
}

#pragma mark - actions

- (void)fetchWorldCupData{
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    /*
     //SERVICE CALL - ONLINE USE
    
     NSString *requestURLString = HOST_URL;
     NSURL *url = [NSURL URLWithString:requestURLString];
     
     NSURLRequest *request = [NSURLRequest requestWithURL:url];
     
     NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
     
     if (!data) {
     NSLog(@"\n\nFailed to retrieve data. Encounted the following problem:\n%@", error.localizedDescription);
     return;
     }
         
         // write to file
         NSString *wcDataFile = [documentDirectory stringByAppendingPathComponent:@"responseData.json"];
         
         if ([manager createFileAtPath:wcDataFile contents:data attributes:nil]){
             // read from file
             NSData *wcDataFromFile = [NSData dataWithContentsOfFile:wcDataFile];
             NSDictionary *wcjsonData = [NSJSONSerialization JSONObjectWithData:wcDataFromFile options:0 error:nil];
             
             // consume data
             self.privateStadiums = wcjsonData[@"stadiums"];
             self.privateTeams = wcjsonData[@"teams"];
             self.privateGroups = wcjsonData[@"groups"];
             self.privateKnockouts = wcjsonData[@"knockout"];
         }
         
         dispatch_async(dispatch_get_main_queue(), ^{
             // run groups on the main thread
             [self generateTournamentGroups];
         });
     
     }];
     
     [dataTask resume];
    */
    
    // OFFLINE USE
    
    NSString *wcDataFile = [documentDirectory stringByAppendingPathComponent:@"responseData.json"];
    if ([manager fileExistsAtPath:wcDataFile]) {
        NSData *wcDataFromFile = [NSData dataWithContentsOfFile:wcDataFile];
        NSDictionary *wcjsonData = [NSJSONSerialization JSONObjectWithData:wcDataFromFile options:0 error:nil];
        
        // consume data
        self.privateStadiums = wcjsonData[@"stadiums"];
        self.privateTeams = wcjsonData[@"teams"];
        self.privateGroups = wcjsonData[@"groups"];
        self.privateKnockouts = wcjsonData[@"knockout"];
        
        // create tournament groups
        [self generateTournamentGroups];
    }
}

- (void)generateTournamentGroups{
    NSDictionary *groups = self.privateGroups;
    
    NSArray *arrayOfGroups = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h"];
    tournamentGroups = [[NSMutableArray alloc] initWithCapacity:groups.count];
    
    for (id groupName in arrayOfGroups) {
        NSDictionary *groupDict = groups[groupName];
        
        // create an AESGroup
        AESGroup *aGroup = [[AESGroup alloc] initWithGroupName:[groupDict objectForKey:@"name"] winner:[groupDict objectForKey:@"winner"] runnerUp:[groupDict objectForKey:@"runnerup"] andGroupMatches:[groupDict objectForKey:@"matches"]];
        
        [tournamentGroups addObject:aGroup];
    }
}

- (NSArray *)fetchTournmentGroups{
    return tournamentGroups;
}

- (NSArray *)fetchStadiums{
    NSArray *stadiums = self.privateStadiums;
    
    for (id s in stadiums) {
        // create an AESStadium
        AESStadium *stadium = [[AESStadium alloc] initWithStadiumID:[s[@"id"] intValue] stadiumName:s[@"name"] stadiumCity:s[@"city"] andStadiumImage:nil];
        
        // add to the collection
        [tournamentStadiums addObject:stadium];
    }
    
    return tournamentStadiums;
}

- (NSArray *)fetchTeams{
    NSArray *teams = self.privateTeams;
    participatingTeams = [[NSMutableArray alloc] init];
    
    for (id t in teams) {
        // create an AESParticipatingTeam
        AESParticipatingTeam *team = [[AESParticipatingTeam alloc] initWithTeamID:[t[@"id"] intValue] name:t[@"name"] fifaCode:t[@"fifaCode"] flag:nil andEmojiString:t[@"emojiString"]];
        
        // add to the collection
        [participatingTeams addObject:team];
    }
    return participatingTeams;
}

- (void)teamsDataPerGroup:(AESGroup *)agroup{
    teamsPerGroup = [[NSMutableArray alloc] init];
    stadiumsPerGroup = [[NSMutableArray alloc] init];;
    matchesPerGroup = [[NSMutableArray alloc] init];
    
    NSArray *groupMatches = agroup.groupMatches;
    NSArray *teams = [self fetchTeams];
    NSArray *stadiums = [self fetchStadiums];
    
    for (NSDictionary *m in groupMatches) {
        // find teams in matches
        for (AESParticipatingTeam *t in teams) {
            if (t.teamID == [m[@"home_team"] intValue] || t.teamID == [m[@"away_team"] intValue]) {
                
                // add to list
                if (![teamsPerGroup containsObject:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:t.teamID], @"id", t.fifaCode, @"fifaCode", t.emojiString, @"emojiString",[NSNumber numberWithInt:0], @"teamGP", [NSNumber numberWithInt:0], @"teamPts", [NSNumber numberWithInt:0], @"teamW", [NSNumber numberWithInt:0], @"teamL", [NSNumber numberWithInt:0], @"teamD", [NSNumber numberWithInt:0], @"teamGA", [NSNumber numberWithInt:0], @"teamGF", [NSNumber numberWithInt:0], @"teamGD", nil]]){
                    
                    [teamsPerGroup addObject:[NSDictionary dictionaryWithObjects:@[[NSNumber numberWithInt:t.teamID], t.fifaCode, t.emojiString, [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0]] forKeys:@[@"id", @"fifaCode", @"emojiString", @"teamGP", @"teamPts", @"teamW", @"teamL", @"teamD", @"teamGA", @"teamGF", @"teamGD"]]];
                }else{
                    continue;
                }
                
            }
        }
        
        // find stadiums used per match
        for (AESStadium *s in stadiums) {
            // add to list
            if (![stadiumsPerGroup containsObject:[NSNumber numberWithInt:s.stadiumID]]) {
                [stadiumsPerGroup addObject:[NSDictionary dictionaryWithObjects:@[[NSNumber numberWithInt:s.stadiumID], s.stadiumName, s.stadiumCity] forKeys:@[@"id", @"name", @"city"]]];
            }else{
                continue;
            }
        }
        
        // create AESMatches per group
        AESGroupMatch *groupMatch = [[AESGroupMatch alloc] initWithMatchName:m[@"name"] homeTeam:[m[@"home_team"] intValue] awayTeam:[m[@"away_team"] intValue] homeTeamGoals:[m[@"home_result"] intValue] awayTeamGoal:[m[@"away_result"] intValue] matchDate:m[@"date"] stadium:m[@"stadium"] finished:m[@"finished"] andMatchDay:[m[@"matchDay"] intValue]];
        
        [matchesPerGroup addObject:groupMatch];
    }
    
    // generate teams log standing data
    [self statsForGroupTeams:teamsPerGroup playedMatches:matchesPerGroup];
}

- (NSArray *)fetchStadiumsPerGroup:(AESGroup *)agroup{
    return stadiumsPerGroup;
}

- (NSArray *)fetchteamsDataPerGroup:(AESGroup *)agroup{
    return teamsPerGroup;
}

- (NSArray *)fetchMatchesPerGroup:(AESGroup *)agroup{
    return matchesPerGroup;
}

- (NSArray *)statsForGroupTeams:(NSArray *)teams playedMatches:(NSArray <AESGroupMatch *>*)groupMatches{
    
    int teamGPcount = 0; int teamPtsCount = 0; int teamWcount = 0; int teamLcount = 0; int teamDcount = 0; int teamGAcount = 0; int teamGFcount = 0; int teamGDcount = 0;
    
    NSMutableArray *teamStats = [NSMutableArray new];
    
    for (int i = 0; i < teams.count; i++) {
        
        // grab a team's id from a group of 4 teams
        NSDictionary *team = (NSDictionary *)teams[i];
        int teamID = [[team objectForKey:@"id"] intValue];
        
        for (AESGroupMatch *groupMatch in groupMatches) {
            // grab a match from a group a 6 matches
            AESGroupMatch *aMatch = (AESGroupMatch *)groupMatch;
            
            // check team play type...played as home or away team
            if (aMatch.homeTeam == teamID || aMatch.awayTeam == teamID ) {
                teamGPcount++;
                
                // check wins
                if (aMatch.homeTeam == teamID  && aMatch.homeTeamGoals > aMatch.awayTeamGoals) {
                    teamWcount++;
                    teamPtsCount += 3;
                    
                                        teamGFcount += aMatch.homeTeamGoals;
                                        teamGAcount += aMatch.awayTeamGoals;
                }else if (aMatch.awayTeam == teamID && aMatch.awayTeamGoals > aMatch.homeTeamGoals){
                    teamWcount++;
                    teamPtsCount += 3;
                    
                                        teamGFcount += aMatch.awayTeamGoals;
                                        teamGAcount += aMatch.homeTeamGoals;
                }
                else{
                    // check looses
                    if (aMatch.homeTeam == teamID ) {
                        if (aMatch.awayTeamGoals > aMatch.homeTeamGoals) {
                            teamLcount++;
                        }
                    }else if (aMatch.awayTeam == teamID ){
                        if (aMatch.awayTeamGoals < aMatch.homeTeamGoals) {
                            teamLcount++;
                        }
                    }
                }
            }
            
        }
        
        teamDcount = teamGPcount - teamWcount - teamLcount;
        
        if (teamDcount != 0) {
            teamPtsCount += teamDcount;
        }
        
        teamGDcount = teamGFcount - teamGAcount;
        
        NSMutableDictionary * d = [team mutableCopy];
        [d setValue:[NSNumber numberWithInt:teamGPcount] forKey:@"teamGP"];
        [d setValue:[NSNumber numberWithInt:teamPtsCount] forKey:@"teamPts"];
        [d setValue:[NSNumber numberWithInt:teamWcount] forKey:@"teamW"];
        [d setValue:[NSNumber numberWithInt:teamLcount] forKey:@"teamL"];
        [d setValue:[NSNumber numberWithInt:teamDcount] forKey:@"teamD"];
                [d setValue:[NSNumber numberWithInt:teamGAcount] forKey:@"teamGA"];
                [d setValue:[NSNumber numberWithInt:teamGFcount] forKey:@"teamGF"];
                [d setValue:[NSNumber numberWithInt:teamGDcount] forKey:@"teamGD"];
        
        [teamStats addObject:d];
        
        // reset counts
        teamGPcount = 0;
        teamPtsCount = 0;
        teamWcount = 0;
        teamLcount = 0;
                teamGAcount = 0;
                teamGFcount = 0;
                teamGDcount =0;
        
    }
    
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"teamGD" ascending:NO];
    NSArray *descriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    NSArray *sortedTeamStats = [teamStats sortedArrayUsingDescriptors:descriptors];
    
    teamsData = [NSArray arrayWithArray:sortedTeamStats];
    
    return teamsData;
}

- (NSArray *)fetchTeamsData{
    return teamsData;
}

@end
