//
//  collectionViewCell.h
//  testKvo
//
//  Created by ChangZuozhen on 14-1-6.
//  Copyright (c) 2014年 ChangZuozhen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface collectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UILabel *label;
//@property (strong, nonatomic) IBOutlet UIView *cellicon;
@property (strong, nonatomic) IBOutlet UIImageView *cellicon;
-(void)updatewithIndexPath:(NSIndexPath *)indexPath;
-(void)resetColorwithIndexPath:(NSIndexPath *)indexPath;
@end
