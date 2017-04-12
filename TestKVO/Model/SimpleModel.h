//
//  SimpleModel.h
//  TestKVO
//
//  Created by Hung Chang Lo on 12/04/2017.
//  Copyright © 2017 hungclo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SimpleModel : NSObject

+(id) sharedInstance;

@property (nonatomic, strong)NSString *name;

@end
