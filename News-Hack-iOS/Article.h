//
//  Article.h
//  News-Hack-iOS
//
//  Created by Lukas Carvajal on 9/11/15.
//  Copyright (c) 2015 Lukas Carvajal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *originalURL;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *snippet;

@end
