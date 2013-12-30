//
//  ViewController.m
//  testKvo
//
//  Created by ChangZuozhen on 13-12-30.
//  Copyright (c) 2013年 ChangZuozhen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self handleinit];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)handleinit{
    [[classA sharedclassA]addObserver:[classb sharedclassb] forKeyPath:@"aaa" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}
- (IBAction)btn1:(UIButton *)sender {
    static int a = 0;
    [[classA sharedclassA]setAaa:++a];
}
-(void)test1{
    
}
-(void)test2{
    
}
@end
