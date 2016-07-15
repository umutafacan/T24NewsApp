//
//  StoriesCollectionViewCell.m
//  T24News
//
//  Created by umut on 7/13/16.
//  Copyright © 2016 Umut Afacan. All rights reserved.
//

#import "StoriesCollectionViewCell.h"

@implementation StoriesCollectionViewCell

-(void)configureStoryCell:(T24StoriesData *)data
{
    
    
    _label.text = data.title;
    
    _imageView.allowsAnimations=YES;
    _imageView.managesRequestPriorities=YES;
    [_imageView prepareForReuse];
    [_imageView setImageWithResource:[NSURL URLWithString:[data.images.box substringFromIndex:2]] targetSize:_imageView.frame.size contentMode:DFImageContentModeAspectFill options:nil];


}



@end
