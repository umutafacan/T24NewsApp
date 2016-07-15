//
//  StoriesViewController.m
//  T24News
//
//  Created by umut on 7/13/16.
//  Copyright © 2016 Umut Afacan. All rights reserved.
//

#import "StoriesViewController.h"
#import <SVPullToRefresh/SVPullToRefresh.h>
#import "DetailViewController.h"

@interface StoriesViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *arrayStories;

@property (nonatomic) int pageNumber;

@end

#pragma mark - Life

@implementation StoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pageNumber = 1;
    [self retrieveStoriesAt:_pageNumber];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    
    [self.collectionView addInfiniteScrollingWithActionHandler:^{
        _pageNumber++;
        [self retrieveStoriesAt:_pageNumber];
        
    }];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CollectionView DataSources


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    StoriesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"StoriesCollectionViewCell" forIndexPath:indexPath];
    if (cell) {
        [cell configureStoryCell:[self.arrayStories objectAtIndex:indexPath.row]];
        cell.indexRow = indexPath.row;
    }
    
    return cell;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.arrayStories.count;
    
}

#pragma mark - CollectionView Delegates

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}


-(void)retrieveStoriesAt:(int)page
{
    [[ServiceManager sharedManager]fetchStoriesAtPage:page WithCompletion:^(T24StoriesResponse *response) {
       
        
        self.arrayStories = (NSMutableArray *)response.data;
        
        self.pageNumber =(int)response.paging.current;
        
        [self.collectionView reloadData];
        
        if (page == 1) {
            [self.delegate sendLoadingFinished];
        }
        
    } failure:^(NSError *error) {
        if (page == 1) {
            [self.delegate sendLoadingFinished];
        }
        
    }];

}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"detail"]) {
        DetailViewController *destVC =  segue.destinationViewController;
        StoriesCollectionViewCell *cell = sender;
        destVC.data = [self.arrayStories objectAtIndex:cell.indexRow];
        
    }
    

}


@end
