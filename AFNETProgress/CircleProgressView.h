//
//  CircleProgressView.h
//  AFNETProgress
//
//  Created by apple on 16/10/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleProgressView : UIView

@property (nonatomic,strong) CAShapeLayer *outLayer;
@property (nonatomic,strong) CAShapeLayer *progressLayer;
@property (nonatomic,strong) UILabel *titleLable;

// 设置图片
- (void)setImageURL:(NSString *)url;
// 更新进度
- (void)updateProgressWithNumber:(NSUInteger)number;


@end
