//
//  ViewController.m
//  testKvo
//
//  Created by ChangZuozhen on 13-12-30.
//  Copyright (c) 2013年 ChangZuozhen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageview1;
@property (strong, nonatomic) IBOutlet UIImageView *uiimageview2;

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
    [self.uiimageview2 setImage:[UIImage imageNamed:@"LASTPOINTred"]];
}

-(void)test1{
    
}
-(void)test2{
    
}
- (IBAction)btn2:(id)sender {
    [self.uiimageview2 setImage:[self reSizeImage:[self convertViewToImage:self.imageview1] toSize:CGSizeMake(180, 180)]];
}

- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize
{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSLog(@"%@",NSStringFromCGSize(reSizeImage.size));
    return reSizeImage;
}
-(UIImage*)convertViewToImage:(UIView*)v{
    
    UIGraphicsBeginImageContext(v.bounds.size);
    
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"testSegue"]) {
        [[classA sharedclassA]setThumbimage:[self convertViewToImage:self.imageview1]];
    }
}
@end
