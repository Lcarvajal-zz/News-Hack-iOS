//
//  ArticleViewController.h
//  News-Hack-iOS
//
//  Created by Lukas Carvajal on 9/11/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleViewController : UIViewController

@property (strong, nonatomic) NSString* articleTitle;
@property (strong, nonatomic) NSString* articleURL;
@property (strong, nonatomic) NSString* originalURL;
@property (weak, nonatomic) IBOutlet UIWebView *articleWebView;

- (IBAction)shareButton:(id)sender;

@end
