//
//  StoriesCollectionViewCell.h
//  T24News
//
//  Created by umut on 7/13/16.
//  Copyright © 2016 Umut Afacan. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "DFImageView.h"

@interface StoriesCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet DFImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic) NSInteger indexRow;

-(void)configureStoryCell:(T24StoriesData *)data;


@end
