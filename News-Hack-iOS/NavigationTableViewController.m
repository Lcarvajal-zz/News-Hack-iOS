//
//  NavigationTableViewController.m
//  News-Hack-iOS
//
//  Created by Lukas Carvajal on 9/11/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import "NavigationTableViewController.h"

@interface NavigationTableViewController ()

@property NSArray *menu;

@end

@implementation NavigationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set menu items.
    if (!_menu) {
        
        _menu = [[NSArray alloc] initWithObjects: @"HomeMenuCell", @"WorldMenuCell", @"USMenuCell", @"BusinessMenuCell", @"PoliticsMenuCell", @"TechnologyMenuCell", @"OpinionMenuCell", nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.menu.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.menu[indexPath.row] forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] ) {
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
        
        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
            
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            
            NewsTableViewController *newsDVC = (NewsTableViewController*)dvc;
            newsDVC.newsSource = @"hi";
            
            if([segue.identifier isEqualToString:@"TopNewsSegue"]) {
                
                // Set properties for Top News.
                newsDVC.sectionTitle = @"Top News";
                newsDVC.newsSource = @"http://newshackapp.bitnamiapp.com/News-Hack-Web-Service/NYTimes/NYTimesNHHomeCall";
            } else if([segue.identifier isEqualToString:@"WorldNewsSegue"]) {
                
                // Set properties for World News.
                newsDVC.sectionTitle = @"World News";
                newsDVC.newsSource = @"http://newshackapp.bitnamiapp.com/News-Hack-Web-Service/NYTimes/NYTimesNHWorldCall";
            } else if([segue.identifier isEqualToString:@"USNewsSegue"]) {
                
                // Set properties for US News.
                newsDVC.sectionTitle = @"US News";
                newsDVC.newsSource = @"http://newshackapp.bitnamiapp.com/News-Hack-Web-Service/NYTimes/NYTimesNHHomeCall";
            } else if([segue.identifier isEqualToString:@"BusinessNewsSegue"]) {
                
                // Set properties for Business News.
                newsDVC.sectionTitle = @"Business";
                newsDVC.newsSource = @"http://newshackapp.bitnamiapp.com/News-Hack-Web-Service/NYTimes/NYTimesNHBusinessCall";
            } else if([segue.identifier isEqualToString:@"PoliticsNewsSegue"]) {
                
                // Set properties for Politics News.
                newsDVC.sectionTitle = @"Politics";
                newsDVC.newsSource = @"http://newshackapp.bitnamiapp.com/News-Hack-Web-Service/NYTimes/NYTimesNHPoliticsCall";
            } else if([segue.identifier isEqualToString:@"TechnologyNewsSegue"]) {
                
                // Set properties for Technology News.
                newsDVC.sectionTitle = @"Technology";
                newsDVC.newsSource = @"http://newshackapp.bitnamiapp.com/News-Hack-Web-Service/NYTimes/NYTimesNHTechnologyCall";
            } else if([segue.identifier isEqualToString:@"OpinionNewsSegue"]) {
                
                // Set properties for Opinion News.
                newsDVC.sectionTitle = @"Opinion";
                newsDVC.newsSource = @"http://newshackapp.bitnamiapp.com/News-Hack-Web-Service/NYTimes/NYTimesNHOpinionCall";
            }

            [navController setViewControllers: @[newsDVC] animated: NO ];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];

            
            
        };
        
    }
}

@end
