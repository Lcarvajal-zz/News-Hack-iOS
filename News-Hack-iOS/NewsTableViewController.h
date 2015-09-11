//
//  NewsTableViewController.h
//  News-Hack-iOS
//
//  Created by Lukas Carvajal on 9/11/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "Article.h"
#import "ArticlesArray.h"
#import "DetailedArticleTableViewCell.h"
#import "ArticleViewController.h"

@interface NewsTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuBarButton;
@property NSString *newsSource;
@property NSString *sectionTitle;

@end
