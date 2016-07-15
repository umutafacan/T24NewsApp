//
//  HotNewsCollectionViewCell.m
//  T24News
//
//  Created by umut on 7/13/16.
//  Copyright © 2016 Umut Afacan. All rights reserved.
//

#import "HotNewsCollectionViewCell.h"

@implementation HotNewsCollectionViewCell



-(void)configureCell:(T24StoriesData *)data
{
    _label.text = data.title;
    
    _imageView.allowsAnimations=YES;
    _imageView.managesRequestPriorities=YES;
    [_imageView prepareForReuse];
    [_imageView setImageWithResource:[NSURL URLWithString:[data.images.list substringFromIndex:2]] targetSize:_imageView.frame.size contentMode:DFImageContentModeAspectFill options:nil];
    
    


}

@end
