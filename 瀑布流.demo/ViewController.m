//
//  ViewController.m
//  瀑布流.demo
//
//  Created by mac on 16/6/10.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "ViewController.h"
#import "WaterFallFlowLayout.h"
#import "WaterFallUICollectionViewCell.h"

//列宽、图片宽度
#define WIDTH ([UIScreen mainScreen].bounds.size.width-20)/2
//图片个数
CGFloat const kImageCount = 40;
//cell标识
static NSString *identifier = @"collectionView";


@interface ViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

/** 图片数据源 */
@property (nonatomic, strong) NSArray  *imageArr;

@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation ViewController

#pragma mark - 图片懒加载
-(NSArray*)imageArr{
    if (!_imageArr) {
        NSMutableArray *muArr = [NSMutableArray array];
        for (int i=1; i<=kImageCount; i++) {
            UIImage *image = [UIImage imageNamed:[[NSString alloc] initWithFormat:@"%d",i]];
            [muArr addObject:image];
        }
        _imageArr = muArr;
    }
    return _imageArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    WaterFallFlowLayout *flowLayout = [[WaterFallFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor redColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[WaterFallUICollectionViewCell class] forCellWithReuseIdentifier:identifier];
    [self.view addSubview:self.collectionView];
}

#pragma mark - UICollectionView dataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.imageArr count];
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WaterFallUICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.image = self.imageArr[indexPath.item];
    return cell;
}

#pragma mark - 计算图片高度
-(float)imageHeight:(float)height width:(float)width{
    /*
     高度/宽度 = 压缩后高度/压缩后宽度
     */
    float newHeight = height/width*(WIDTH);
    return newHeight;
}

#pragma mark - cell大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    UIImage *imge = [self.imageArr objectAtIndex:indexPath.row];
    float height = [self imageHeight:imge.size.height width:imge.size.width];
    return CGSizeMake(WIDTH, height);
}

#pragma mark - 边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    UIEdgeInsets edgeInsets = {5,5,5,5};
    return edgeInsets;
}
@end