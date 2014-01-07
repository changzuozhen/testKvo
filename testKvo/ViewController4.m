//
//  ViewController4.m
//  testKvo
//
//  Created by ChangZuozhen on 14-1-6.
//  Copyright (c) 2014年 ChangZuozhen. All rights reserved.
//

#import "ViewController4.h"
#import "collectionViewCell.h"
#import "collectionReusableView.h"
#import "settings.h"
static float rowCellCount = 4.0;
static float lineCellCount = 6.0;
@interface ViewController4 ()
//@property (strong, nonatomic) IBOutlet UICollectionViewCell *onecell;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;


@end

@implementation ViewController4

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//-vie
- (void)viewDidLoad
{
    [super viewDidLoad];
//    NSLog(@"loadPersistData");
//    [self performSelectorOnMainThread:@selector(loadPersistData:) withObject:nil waitUntilDone:YES];
//    [self loadPersistData:nil];
//    NSLog(@"toplayOutGuide: %@",self.navigationController.topLayoutGuide);//self.topLayoutGuide);
	// Do any additional setup after loading the view.
}
-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"savePersistentData");
    [[settings sharedsettings] savePersistentData:nil];
}





#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 24;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    collectionViewCell * result = nil;
    int i = 0;
    NSString * identifer = @"cell1";//[self identiferForItemAtIndexPath:indexPath];
    while (!result) {
//        while (!identifer) {
//            NSLog(@"identifer not good !!!!!!!!!!!!!");
//            identifer = [self identiferForItemAtIndexPath:indexPath];
//        }
        result = [collectionView dequeueReusableCellWithReuseIdentifier:identifer forIndexPath:indexPath];
        if ([indexPath isEqual:[[collectionView indexPathsForSelectedItems] lastObject]]) {
            [result setBackgroundColor:[UIColor yellowColor]];
        }else{
            [result setBackgroundColor:[self colorForItemAtIndexPath:indexPath]];
        }
        NSString * key = [NSString stringWithFormat:@"%d %d", [indexPath indexAtPosition:0],[indexPath indexAtPosition:1]];
//        NSLog(@"get cell of : %@",key);
        if ([[settings sharedsettings].playedCount objectForKey:key] == nil) {
            [[settings sharedsettings].playedCount setObject:[NSNumber numberWithInt:0] forKey:key];
        }else{
//            NSLog(@"[settings sharedsettings].playedCount has key: %@",key);
        }
        [result.label setText:[NSString stringWithFormat:@"%d %d",[indexPath indexAtPosition:1],[[[settings sharedsettings].playedCount objectForKey:key] integerValue]]];
        i++;
        if (i>1) {
            NSLog(@"dequeueReusableCellWithReuseIdentifier not good !!!!!!!!!!!!!");
        }
    }

//    CGPoint center = [result convertPoint:result.center fromView:result.superview];
//    UILabel * label = [[UILabel alloc] init];
//    [label setText:[NSString stringWithFormat:@"%d",[indexPath indexAtPosition:1]+1]];
//    [result addSubview:label];
    return result;
}
-(NSString *)identiferForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString * result = [NSString stringWithFormat:@"cell%d",[indexPath indexAtPosition:0]%4+1];
    
    return result;
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
//@optional

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 20;
}

// The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    collectionReusableView
    UICollectionReusableView * result = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"supplementary" forIndexPath:indexPath];
//    [result.label setText:[NSString stringWithFormat:@"知识点： %d",[indexPath indexAtPosition:0]]];
    NSLog(@"%@",[NSString stringWithFormat:@"知识点： %d",[indexPath indexAtPosition:0]]);
    [self.navigationItem setTitle:[NSString stringWithFormat:@"知识点： %d",[indexPath indexAtPosition:0]]];
    [self.pageControl setCurrentPage:[indexPath indexAtPosition:0]];
    return result;
}

#pragma mark - UICollectionViewDelegate
//@optional

// Methods for notification of selection/deselection and highlight/unhighlight events.
// The sequence of calls leading to selection from a user touch is:
//
// (when the touch begins)
// 1. -collectionView:shouldHighlightItemAtIndexPath:
// 2. -collectionView:didHighlightItemAtIndexPath:
//
// (when the touch lifts)
// 3. -collectionView:shouldSelectItemAtIndexPath: or -collectionView:shouldDeselectItemAtIndexPath:
// 4. -collectionView:didSelectItemAtIndexPath: or -collectionView:didDeselectItemAtIndexPath:
// 5. -collectionView:didUnhighlightItemAtIndexPath:
//1
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
//    if ([indexPath indexAtPosition:1]%2 == 0) {
//        return YES;
//    }
//    return NO;
    NSLog(@"**********\nshouldHighlightItemAtIndexPath");
    return YES;
}
//2
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"didHighlightItemAtIndexPath");
    [[collectionView cellForItemAtIndexPath:indexPath]setBackgroundColor:[UIColor whiteColor]];
}
//5
- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"didUnhighlightItemAtIndexPath");
    [[collectionView cellForItemAtIndexPath:indexPath]setBackgroundColor:[self colorForItemAtIndexPath:indexPath]];
}
//3
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"shouldSelectItemAtIndexPath");
    //在这里可以加入关卡锁定功能

    return YES;
}
//3
- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"shouldDeselectItemAtIndexPath");

    return YES;
}// called when the user taps on an already-selected item in multi-select mode
//4
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"didSelectItemAtIndexPath : %@",indexPath);
    collectionViewCell * tempCell = (collectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [tempCell setBackgroundColor:[UIColor yellowColor]];
    //加入segue处理函数
    
//    NSString * key = [NSString stringWithFormat:@"%@",indexPath];
    NSString * key = [NSString stringWithFormat:@"%d %d", [indexPath indexAtPosition:0],[indexPath indexAtPosition:1]];
    NSNumber * value = [[settings sharedsettings].playedCount objectForKey:key];
    if (value == nil) {
        [[settings sharedsettings].playedCount setObject:[NSNumber numberWithInt:0] forKey:key];
    }else{
        int temp = [value integerValue]+1;
        [[settings sharedsettings].playedCount setObject:[NSNumber numberWithInt:temp] forKey:key];
    }
    [tempCell.label setText:[NSString stringWithFormat:@"%d %d",[indexPath indexAtPosition:1],[[[settings sharedsettings].playedCount objectForKey:key] integerValue]]];
}
//4
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"didDeselectItemAtIndexPath");
    [[collectionView cellForItemAtIndexPath:indexPath]setBackgroundColor:[self colorForItemAtIndexPath:indexPath]];
}

//- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath;
//- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(UICollectionReusableView *)view forElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath;

// These methods provide support for copy/paste actions on cells.
// All three should be implemented if any are.
//- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath;
//- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender;
//- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender;

// support for custom transition layout
//- (UICollectionViewTransitionLayout *)collectionView:(UICollectionView *)collectionView transitionLayoutForOldLayout:(UICollectionViewLayout *)fromLayout newLayout:(UICollectionViewLayout *)toLayout{
//    NSLog(@"from: %@",fromLayout);
//    NSLog(@"to: %@",toLayout);
//    UICollectionViewTransitionLayout * result = [[UICollectionViewTransitionLayout alloc] initWithCurrentLayout:<#(UICollectionViewLayout *)#> nextLayout:<#(UICollectionViewLayout *)#>];
//    
//    return fromLayout;
//}

#pragma mark - UICollectionViewDelegateFlowLayout
//@optional
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    float width1 = (collectionView.bounds.size.height - 86)/(lineCellCount + 1) ;
    float width2 = (collectionView.bounds.size.width-1)/(rowCellCount + 1) ;
    float width = width1<width2 ? width1 : width2;
    CGSize result = CGSizeMake(width, width);
    return result;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    float width1 = (collectionView.bounds.size.height - 86)/(lineCellCount + 1) ;
    float width2 = (collectionView.bounds.size.width-1)/(rowCellCount + 1) ;
    float width = width1<width2 ? width1 : width2;
    CGFloat a = collectionView.bounds.size.width-1;
    CGFloat b = collectionView.bounds.size.height - 86;
    CGFloat temp = (a-width*rowCellCount)/(rowCellCount + 1) ;
    CGFloat vertical = b/(lineCellCount + 1)/(lineCellCount + 1);
//    NSLog(@"insetForSectionAtIndex:   %f",temp);
    UIEdgeInsets result = UIEdgeInsetsMake(0, temp, vertical*2, temp);
    return result;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    float width1 = (collectionView.bounds.size.height - 86)/(lineCellCount + 1) ;
    float width2 = (collectionView.bounds.size.width-1)/(rowCellCount + 1) ;
    float width = width1<width2 ? width1 : width2;
    CGFloat a = collectionView.bounds.size.width-1;
    CGFloat result = (a-width*rowCellCount)/(rowCellCount + 1) ;
//    NSLog(@"minimumLineSpacingForSectionAtIndex:   %f",result);
    return result;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    CGFloat b = collectionView.bounds.size.height - 86;
    CGFloat vertical = b/(lineCellCount + 1)/(lineCellCount + 1);
    return vertical;
}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;
@end
