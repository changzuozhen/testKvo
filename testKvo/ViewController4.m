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
@property (strong, nonatomic) IBOutlet UICollectionView *theCollectionView;


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




#pragma mark - tests
- (IBAction)btn_test:(id)sender {
    static int sectiontemp = 0;
    sectiontemp++;
    if (sectiontemp > 19) {
        sectiontemp = 0;
    }
    [self zoomToPage:sectiontemp];

}
-(void)zoomToPage:(int)page{
    //    NSIndexPath * indexTemp = [NSIndexPath indexPathForItem:18 inSection:sectiontemp];
    //    NSLog(@"%@",indexTemp);
    //    [self.theCollectionView scrollToItemAtIndexPath:indexTemp atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
    CGRect rectframe = self.theCollectionView.bounds;
    //    CGRect rectTemp = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    rectframe.origin.x = rectframe.size.width*(float)page;
    NSLog(@"%@",NSStringFromCGRect(rectframe));
    //    [self.theCollectionView zoomToRect:rectframe animated:YES];
    [self.theCollectionView scrollRectToVisible:rectframe animated:YES];
}
#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 24;
}


// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    collectionViewCell * result = nil;
//    int i = 0;
    NSString * identifer = @"cell1";//[self identiferForItemAtIndexPath:indexPath];
    while (!result) {
//        while (!identifer) {
//            NSLog(@"identifer not good !!!!!!!!!!!!!");
//            identifer = [self identiferForItemAtIndexPath:indexPath];
//        }
        result = [collectionView dequeueReusableCellWithReuseIdentifier:identifer forIndexPath:indexPath];

        NSString * key = [NSString stringWithFormat:@"%d %d", [indexPath indexAtPosition:0],[indexPath indexAtPosition:1]];
//        NSLog(@"get cell of : %@",key);
        if ([[settings sharedsettings].playedCount objectForKey:key] == 0) {
            [[settings sharedsettings].playedCount setObject:[NSNumber numberWithInt:0] forKey:key];
        }else{
//            NSLog(@"[settings sharedsettings].playedCount has key: %@",key);
        }
        [result updatewithIndexPath:indexPath];
        
        if ([indexPath isEqual:[[collectionView indexPathsForSelectedItems] lastObject]]) {
            [result setBackgroundColor:[UIColor yellowColor]];
        }
//        else{
////            [result setBackgroundColor:[self colorForItemAtIndexPath:indexPath]];
//            [result resetColorwithIndexPath:indexPath];
//        }
//        [result.label setText:[NSString stringWithFormat:@"%d %d",[indexPath indexAtPosition:1],[[[settings sharedsettings].playedCount objectForKey:key] integerValue]]];
//        i++;
//        if (i>1) {
//            NSLog(@"dequeueReusableCellWithReuseIdentifier not good !!!!!!!!!!!!!");
//        }
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
    NSLog(@"**********shouldHighlightItemAtIndexPath**********");
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
//    [[collectionView cellForItemAtIndexPath:indexPath]setBackgroundColor:[self colorForItemAtIndexPath:indexPath]];
    collectionViewCell * tempCell = (collectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [tempCell resetColorwithIndexPath:indexPath];
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

    //加入segue处理函数
//    [self performSegueWithIdentifier:@"scroViewSegue" sender:collectionView];
//    NSString * key = [NSString stringWithFormat:@"%@",indexPath];
    NSString * key = [NSString stringWithFormat:@"%d %d", [indexPath indexAtPosition:0],[indexPath indexAtPosition:1]];
    NSNumber * value = [[settings sharedsettings].playedCount objectForKey:key];
    if (value == nil) {
        [[settings sharedsettings].playedCount setObject:[NSNumber numberWithInt:0] forKey:key];
    }else{
        int temp = [value integerValue]+1;
        [[settings sharedsettings].playedCount setObject:[NSNumber numberWithInt:temp] forKey:key];
    }
//    [self updateCell:tempCell withIndexPath:indexPath];
    [tempCell updatewithIndexPath:indexPath];
    [tempCell setBackgroundColor:[UIColor yellowColor]];
    //    [tempCell.label setText:[NSString stringWithFormat:@"%d %d",[indexPath indexAtPosition:1],[[[settings sharedsettings].playedCount objectForKey:key] integerValue]]];
}
//4
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"didDeselectItemAtIndexPath");
//        [self updateCell:tempCell withIndexPath:indexPath];
    collectionViewCell * tempCell = (collectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [tempCell resetColorwithIndexPath:indexPath];
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
