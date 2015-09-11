//
//  ArticlesArray.m
//  News-Hack-iOS
//
//  Created by Lukas Carvajal on 9/11/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import "ArticlesArray.h"

@implementation ArticlesArray

- (id)initWithSource:(NSString *)source {
    
    // Link for GET request from News Hack web service.
    NSURL *url = [[NSURL alloc] initWithString:source];
    
    // Array for holding all articles.
    NSMutableArray *articles = [[NSMutableArray alloc] initWithCapacity:0];
    
    // Handle JSON and receive News Hack web service results.
    NSDictionary* dict = [self setUpJSON:url];
    
    // Store results in article objects in  nytNews array.
    for (id object in dict) {
        
        Article *article = [[Article alloc] init];
        article.title = [object valueForKey:@"title"];
        article.author = [[[object valueForKey:@"author"] lowercaseString] capitalizedString];
        article.url = [self translateURL: [object valueForKey:@"url"]] ;
        article.category = [object valueForKey:@"category"];
        article.snippet = [object valueForKey:@"snippet"];
        
        [articles addObject:article];
    }
    
    // Initialize with articles.
    self = [super init];
    
    if (self) {
        
        self = [articles copy];
    }
    
    return self;
}

- (NSDictionary*) setUpJSON:(NSURL*) url {
    
    // Declare dictionary of urls to be returned.
    NSDictionary *dict;
    
    // Prepare request object.
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url
                                                cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                            timeoutInterval:30];
    
    // Prepare variables for JSON response.
    NSData *urlData;
    NSURLResponse *response;
    NSError *error;
    
    // Make sunchronous request.
    urlData = [NSURLConnection sendSynchronousRequest:urlRequest
                                    returningResponse:&response
                                                error:&error];
    
    // Check for error in retrieving data.
    if (urlData != nil)
    {
        dict = [NSJSONSerialization JSONObjectWithData:urlData options: NSJSONReadingMutableContainers error: &error];
        
        return dict;
    }
    else
    {
        if (error != nil)
        {
            NSLog(@"Error description=%@", [error description]);
        }
    }
    
    return dict;
}

- (NSString*) translateURL:(NSString *)url {
    
    // "translate" article from japanese.
    url = [ @"http://translate.google.com/translate?sl=ja&tl=en&u=" stringByAppendingString: url];
    
    // Download webpage.
    NSURL *exUrl = [NSURL URLWithString:url];
    NSData *htmlData = [NSData dataWithContentsOfURL:exUrl];
    
    // Create parser.
    TFHpple *parser = [TFHpple hppleWithHTMLData:htmlData];
    
    // Get url from google translated iframe.
    NSString *articleURL = @"//iframe";
    NSArray *node = [parser searchWithXPathQuery:articleURL];
    TFHppleElement *element = [node objectAtIndex:0];
    url = [element objectForKey:@"src"];
    
    // Add google translate url.
    url = [@"http://translate.google.com" stringByAppendingString: url];
    
    return url;
    
}

@end
