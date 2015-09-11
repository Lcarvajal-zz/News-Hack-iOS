//
//  NewsTableViewController.m
//  News-Hack-iOS
//
//  Created by Lukas Carvajal on 9/11/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import "NewsTableViewController.h"

@interface NewsTableViewController ()

@property ArticlesArray *articles;

@end

@implementation NewsTableViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Check for source.
    if (self.sectionTitle) {
        
        self.navigationController.navigationBar.topItem.title = self.sectionTitle;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Configure menu bar button item for slide out navigation.
    self.menuBarButton.target = self.revealViewController;
    self.menuBarButton.action = @selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    // Check for source.
    if (!_newsSource) {
        
        _newsSource = @"http://newshackapp.bitnamiapp.com/News-Hack-Web-Service/NYTimes/NYTimesNHHomeCall";
        self.navigationController.navigationBar.topItem.title = @"Top News";
    }
    
    // Create array of articles with top news.
    if(!_articles) {
        
        _articles = [[ArticlesArray alloc] initWithSource:self.newsSource];
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
    return self.articles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailedArticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArticleCell"];
    
    if (!cell) {
        
        [tableView registerNib:[UINib nibWithNibName:@"DetailedArticleTableViewCell" bundle:nil] forCellReuseIdentifier:@"ArticleCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"ArticleCell"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(DetailedArticleTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Article *article = self.articles[indexPath.row];
    
    cell.titleLabel.text = article.title;
    cell.authorLabel.text = article.author;
    cell.snippetLabel.text = article.snippet;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        Article *object = self.articles[indexPath.row];

        
        ArticleViewController *controller = segue.destinationViewController;
        controller.articleTitle = object.title;
        controller.articleURL = object.url;
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}


@end
