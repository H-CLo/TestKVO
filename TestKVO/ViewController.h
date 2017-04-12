//
//  ViewController.h
//  TestKVO
//
//  Created by Hung Chang Lo on 12/04/2017.
//  Copyright © 2017 hungclo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimpleModel.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblInfo;
- (IBAction)btnChangeSimpleModelValue:(UIButton *)sender;

@end

