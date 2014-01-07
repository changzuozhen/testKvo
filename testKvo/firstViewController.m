//
//  firstViewController.m
//  testKvo
//
//  Created by ChangZuozhen on 14-1-7.
//  Copyright (c) 2014年 ChangZuozhen. All rights reserved.
//

#import "firstViewController.h"
#import "settings.h"
@interface firstViewController ()

@end

@implementation firstViewController

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
    [[settings sharedsettings]loadPersistData:nil];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
