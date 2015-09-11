//
//  ArticleViewController.m
//  News-Hack-iOS
//
//  Created by Lukas Carvajal on 9/11/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import "ArticleViewController.h"

@interface ArticleViewController ()

@end

@implementation ArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.articleURL) {
        
        [self.articleWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.articleURL]]];
        self.navigationController.navigationBar.topItem.title = @"News Hack(ed)";
    }
    else {
        
        self.navigationController.navigationBar.topItem.title = @"Error";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareButton:(id)sender {
    
    NSString *articleToShare = self.originalURL;

    NSArray *activityItems = @[articleToShare];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityVC.excludedActivityTypes = @[UIActivityTypeAssignToContact, UIActivityTypePrint, UIActivityTypePostToTwitter, UIActivityTypePostToWeibo];
    [self presentViewController:activityVC animated:TRUE completion:nil];
}
@end
