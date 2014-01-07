//
//  collectionViewCell.m
//  testKvo
//
//  Created by ChangZuozhen on 14-1-6.
//  Copyright (c) 2014年 ChangZuozhen. All rights reserved.
//

#import "collectionViewCell.h"
#import "settings.h"
@implementation collectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)updatewithIndexPath:(NSIndexPath *)indexPath{
    NSString * key = [NSString stringWithFormat:@"%d %d", [indexPath indexAtPosition:0],[indexPath indexAtPosition:1]];
    UIImage * temp = nil;
    switch ([[[settings sharedsettings].playedCount objectForKey:key] integerValue]) {
        case 0:
            [self.cellicon setHidden:YES];
            //            temp = [UIImage imageNamed:@"pixel"];
//            [self.cellicon setImage:temp];
//            [self.cellicon setAlpha:0.5];
//            [self.cellicon setBackgroundColor:[UIColor clearColor]];
//            [self.cellicon setImage:nil];
            break;
        case 1:
            [self.cellicon setHidden:NO];
            temp = [UIImage imageNamed:@"level_passed"];//LASTPOINTred"];//
            [self.cellicon setImage:temp];
            [self.cellicon setAlpha:0.5];
            [self.cellicon setBackgroundColor:[UIColor clearColor]];
            break;
        case 2:
            [self.cellicon setHidden:NO];
            temp = [UIImage imageNamed:@"level_perfect"];//LASTPOINTred"];//levelselect_perfect
            [self.cellicon setImage:temp];
            [self.cellicon setAlpha:0.5];
            [self.cellicon setBackgroundColor:[UIColor clearColor]];
            break;
            
        default:
            [self.cellicon setHidden:NO];
            temp = [UIImage imageNamed:@"levelselect_perfect"];//LASTPOINTred"];//levelselect_perfect
            [self.cellicon setImage:temp];
            [self.cellicon setAlpha:0.5];
            [self.cellicon setBackgroundColor:[UIColor clearColor]];
            //            temp = nil;//[UIImage imageNamed:nil];//pixel"];
//            [self.cellicon setImage:temp];
//            [self.cellicon setAlpha:0.5];
//            [self.cellicon setBackgroundColor:[UIColor clearColor]];
//            [self.cellicon setImage:nil];
            break;
    }
    if (self.cellicon.subviews == nil) {
        NSLog(@"errror");
    }
    [self.label setText:[NSString stringWithFormat:@"%d %d",[indexPath indexAtPosition:1],[[[settings sharedsettings].playedCount objectForKey:key] integerValue]]];
    [self.label setBackgroundColor:[UIColor blackColor]];
    [self.label setTextColor:[self colorForItemAtIndexPath:indexPath]];
    [self setBackgroundColor:[self colorForItemAtIndexPath:indexPath]];
    [self bringSubviewToFront:self.label];
}
-(UIColor *)colorForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *colors = @[
                        [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                        [UIColor colorWithRed:255/255.f green:137/255.f blue:167/255.f alpha:1],
                        [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
                        [UIColor colorWithRed:119/255.f green:152/255.f blue:255/255.f alpha:1],
                        [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                        [UIColor colorWithRed:255/255.f green:137/255.f blue:167/255.f alpha:1],
                        [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
                        [UIColor colorWithRed:119/255.f green:152/255.f blue:255/255.f alpha:1],
                        [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                        [UIColor colorWithRed:255/255.f green:137/255.f blue:167/255.f alpha:1],
                        [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
                        [UIColor colorWithRed:119/255.f green:152/255.f blue:255/255.f alpha:1],
                        ];
    return colors[[indexPath indexAtPosition:0]%12];
}
-(void)resetColorwithIndexPath:(NSIndexPath *)indexPath{
    [self setBackgroundColor:[self colorForItemAtIndexPath:indexPath]];
}
@end
