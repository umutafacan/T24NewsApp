//
//  HotNewsViewController.m
//  T24News
//
//  Created by umut on 7/13/16.
//  Copyright © 2016 Umut Afacan. All rights reserved.
//

#import "HotNewsViewController.h"

@interface HotNewsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) NSMutableArray *arrayNews;

@end

@implementation HotNewsViewController

#pragma mark - LIFE
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self retrieveNews];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CollectionView DataSources


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HotNewsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HotNewsCollectionViewCell" forIndexPath:indexPath];
    if (cell) {
        [cell configureCell:[self.arrayNews objectAtIndex:indexPath]];
    }
    
    return cell;

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.arrayNews.count;

}

#pragma mark - CollectionView Delegates

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{


}



#pragma mark - Service 

-(void)retrieveNews
{
    [[ServiceManager sharedManager]fetchHotNewsWithCompletion:^(T24StoriesResponse *response) {
        
        self.arrayNews =(NSMutableArray*)response.data;
        
        [self.collectionView reloadData];
        [self.delegate sendLoadingComplete];
        
    } failure:^(NSError *error) {
        
    }];

}

-(void)scheduleNewRetrieval
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self retrieveNews];
        [self scheduleNewRetrieval];
        
    });
    

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
