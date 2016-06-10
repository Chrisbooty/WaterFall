//
//  WaterFallUICollectionViewCell.m
//  瀑布流.demo
//
//  Created by mac on 16/6/10.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "WaterFallUICollectionViewCell.h"

//image宽度
#define WIDTH ([UIScreen mainScreen].bounds.size.width-20)/2

@implementation WaterFallUICollectionViewCell

- (void)setImage:(UIImage *)image{
    if (_image != image) {
        _image = image;
    }
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect{
    float newHeight = _image.size.height / _image.size.width * WIDTH;
    [_image drawInRect:CGRectMake(0, 0, WIDTH, newHeight)];
    self.backgroundColor = [UIColor grayColor];
}

@end
