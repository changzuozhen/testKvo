//
//  ViewController2.m
//  testKvo
//
//  Created by ChangZuozhen on 14-1-3.
//  Copyright (c) 2014年 ChangZuozhen. All rights reserved.
//

#import "ViewController2.h"
#import "classA.h"
@interface ViewController2 ()

@end

@implementation ViewController2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.imageview setImage:[classA sharedclassA].thumbimage];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
