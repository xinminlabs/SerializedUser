//
//  SerializedUser.m
//  Xinmin Labs
//
//  Created by Richard Huang on 5/24/14.
//  Copyright (c) 2014 Xinmin Labs. All rights reserved.
//

#import "SerializedUser.h"
#import "SSKeychain.h"

@implementation SerializedUser

+ (instancetype)currentUser {
    return [self readUserFromDisk];
}

+ (BOOL)isLoggedIn {
    return [self currentUser] != nil;
}

- (void)persist {
    [self persistWithToken:self.token];
}

#pragma mark - Priviate Methods

NSString *const DEFAULTS_KEY_USER = @"DeafultsKeyUser";
NSString *const KEYCHAIN_SERVICE  = @"SerializedUser";
NSString *const KEYCHAIN_TOKEN    = @"CurrentUserToken";

+ (instancetype)readUserFromDisk {
    NSString *token = [SSKeychain passwordForService:KEYCHAIN_SERVICE account:KEYCHAIN_TOKEN];

    if (token) {
        SerializedUser *user = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:DEFAULTS_KEY_USER]];
        user.token = token;
        return user;
    } else {
        return nil;
    }
}

- (void)persistWithToken:(NSString *)token {
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:self] forKey:DEFAULTS_KEY_USER];
    [[NSUserDefaults standardUserDefaults] synchronize];

    if (token) {
        [SSKeychain setPassword:token forService:KEYCHAIN_SERVICE account:KEYCHAIN_TOKEN];
    } else {
        [SSKeychain deletePasswordForService:KEYCHAIN_SERVICE account:KEYCHAIN_TOKEN];
    }
}

@end
