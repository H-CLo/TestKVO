//
//  SimpleModel.m
//  TestKVO
//
//  Created by Hung Chang Lo on 12/04/2017.
//  Copyright © 2017 hungclo. All rights reserved.
//

#import "SimpleModel.h"

/**
    首先建立一個 SimpleModel ，有趣的地方只有在我自己建的 name setter ，你可以看到我執行了 willChangeValueForKey和didChangeValueForKey 來自己觸動 KVO 的機制，當然如果你現在看不懂也沒有關係，當你沒有實作 setter 前，其實 KVO 機制自己會進行處理，我只是順手示範了一下想要自己作時該如何進行
 */

@implementation SimpleModel

//Define singleton method
+(id) sharedInstance
{
    static SimpleModel *model = nil;
    static dispatch_once_t dispatchOnce;
    dispatch_once(&dispatchOnce, ^{
        model = [[self alloc] init];
    });
    
    return model;
}

//Overwrite init method
-(id)init
{
    self = [super init];
    if (self)
    {
        _name = @"anistar";
    }
    
    return self;
}

-(void) setName:(NSString *)name
{
    [self willChangeValueForKey:@"name"];
    
    _name = name;
    
    [self didChangeValueForKey:@"name"];
}

@end
