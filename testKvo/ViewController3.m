//
//  ViewController3.m
//  testKvo
//
//  Created by ChangZuozhen on 14-1-6.
//  Copyright (c) 2014年 ChangZuozhen. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()
@property (strong, nonatomic) IBOutlet UIScrollView *scroView;
@property (strong, nonatomic) IBOutlet UIView *containVIew;

//@property (strong, nonatomic) IBOutlet UIButton *btn1;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *btnCollection;

@end

@implementation ViewController3

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
    [self.scroView setContentSize:self.containVIew.frame.size];
    [self.containVIew removeFromSuperview];
    [self.scroView addSubview:self.containVIew];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.containVIew;
}
@end
