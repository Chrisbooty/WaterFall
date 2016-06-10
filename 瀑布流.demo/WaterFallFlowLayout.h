//
//  WaterFallFlowLayout.h
//  瀑布流.demo
//
//  Created by mac on 16/6/10.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaterFallFlowLayout : UICollectionViewFlowLayout

@property(nonatomic,assign)id<UICollectionViewDelegateFlowLayout> delegate;

/** cell的个数 */
@property(nonatomic,assign)NSInteger cellCount;
/** 存放列的高度 */
@property(nonatomic,strong)NSMutableArray *colArr;
/** cell的位置信息 */
@property(nonatomic,strong)NSMutableDictionary *attributeDict;
@end
