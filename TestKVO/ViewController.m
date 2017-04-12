//
//  ViewController.m
//  TestKVO
//
//  Created by Hung Chang Lo on 12/04/2017.
//  Copyright © 2017 hungclo. All rights reserved.
//

#import "ViewController.h"

/**
    在使用 KVO 之前，你不需要先告知你要偵聽哪個 Key 的改變，所以你會看到我在 view 啓動時就用了 addObserver 來加入偵聽動作。
 */

@interface ViewController ()

@end

@implementation ViewController

- (void)initView
{
    SimpleModel *model = [SimpleModel sharedInstance];
    [model addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    _lblInfo.text = model.name;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnChangeSimpleModelValue:(UIButton *)sender {
    SimpleModel *model = [SimpleModel sharedInstance];
    model.name = @"Willey Lo";
}

- (void)dealloc
{
    SimpleModel *model = [SimpleModel sharedInstance];
    [model removeObserver:self forKeyPath:@"name" context: nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@">>>>>>>>>>>> keyPath; %@", keyPath);
    
    // Check which property have changed
    if([keyPath isEqualToString:@"name"]) {
        NSLog(@">>>>>>>> %@", change);
        
        NSString *resultString = [NSString stringWithFormat:@"Old value: %@, New value: %@", [change objectForKey:@"old"], [change objectForKey:@"new"]];
        _lblInfo.text = resultString;
    }
}



























@end
