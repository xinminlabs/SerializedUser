//
//  SerializedUser.h
//  Xinmin Labs
//
//  Created by Richard Huang on 5/24/14.
//  Copyright (c) 2014 Xinmin Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SerializedUser : NSObject

@property (nonatomic, strong) NSString *token;

+ (instancetype)currentUser;
+ (BOOL)isLoggedIn;

- (void)persist;
@end
