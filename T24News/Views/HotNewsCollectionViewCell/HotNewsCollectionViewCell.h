//
//  HotNewsCollectionViewCell.h
//  T24News
//
//  Created by umut on 7/13/16.
//  Copyright © 2016 Umut Afacan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DFImageView.h"

@interface HotNewsCollectionViewCell : UICollectionViewCell
#pragma mark - Properties
@property (weak, nonatomic) IBOutlet DFImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic) NSInteger indexRow;

#pragma mark - Functions
-(void)configureCell:(T24StoriesData *)data;


@end
