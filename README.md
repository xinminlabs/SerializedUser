# SerializedUser

Serialize user with NSUserDefaults and save sensitive token with SSKeychain.

## Adding to Your Project

Simply add the following to your Podfile.

```
pod 'SerializedUser'
```

## Working with the SerializedUser

SerializedUser provides the following class methods.

```
+ (instancetype)currentUser;
+ (BOOL)isUserLoggedIn;
```

SerializedUser also provides an instance method.

```
- (void)persist;
```

SerializedUser adds a property.

```
@property (nonatomic, strong) NSString *token;
```

## Example

1\. You should create your own user model and extend SerializedUser

```
#import "SerializedUser.h"

@interface CLUser : SerializedUser

@property (nonatomic, strong) NSString *email;
@end
```

```
#import "CLUser.h"

@implementation CLUser


- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.email forKey:@"email"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        self.email = [decoder decodeObjectForKey:@"email"];
    }
    return self;
}

@end
```

2\. Then you can persist user.

```
CLUser *user = [[CLUser alloc] init];
user.email = @"flyerhzm@gmail.com";
user.token = @"access_token";
[user persist];
```

3\. And get current user.

```
if ([CLUser isLoggedIn]) {
  [CLUser currentUser].email;
  [CLUser currentUser].token;
}
```
