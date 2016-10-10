//
//  CircleProgressView.m
//  AFNETProgress
//
//  Created by apple on 16/10/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CircleProgressView.h"

#define kLineWidth 6

@interface CircleProgressView ()

@property (nonatomic,strong)UIBezierPath *path;

@end


@implementation CircleProgressView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.outLayer = [CAShapeLayer layer];
        CGRect rect = CGRectMake(kLineWidth/2, kLineWidth/2,frame.size.width - kLineWidth, frame.size.height - kLineWidth);
        
        self.path = [UIBezierPath bezierPathWithOvalInRect:rect];
        self.outLayer.strokeColor = [UIColor lightGrayColor].CGColor;
        self.outLayer.lineWidth = kLineWidth;
        self.outLayer.fillColor =  [UIColor clearColor].CGColor;
        self.outLayer.lineCap = kCALineCapRound;
        self.outLayer.path = _path.CGPath;
        [self.layer addSublayer:self.outLayer];
        
        self.progressLayer = [CAShapeLayer layer];
        self.progressLayer.fillColor = [UIColor clearColor].CGColor;
        self.progressLayer.strokeColor = [UIColor blueColor].CGColor;
        self.progressLayer.lineWidth = kLineWidth;
        self.progressLayer.lineCap = kCALineCapRound;
        self.progressLayer.strokeStart = 0;
        [self.layer addSublayer:self.progressLayer];
        
        self.titleLable = [[UILabel alloc] init];
        self.titleLable.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        self.titleLable.bounds = CGRectMake(0, 0, frame.size.width - kLineWidth-3, frame.size.height - kLineWidth-3);
//        self.titleLable = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width/2, frame.size.height/2, frame.size.width - kLineWidth, frame.size.height - kLineWidth)];
        self.titleLable.layer.cornerRadius = (frame.size.height - kLineWidth)/2;
        self.titleLable.clipsToBounds = YES;
        self.titleLable.text = @"0%";
        self.titleLable.textAlignment = NSTextAlignmentCenter;
        self.titleLable.backgroundColor = [UIColor whiteColor];
//        self.titleLable.transform = CGAffineTransformMakeRotation(M_PI_2);
        [self addSubview:self.titleLable];
        
//        self.transform = CGAffineTransformMakeRotation(-M_PI_2);

        
    }
    return self;
}
- (void)updateProgressWithNumber:(NSUInteger)number {
    
    [CATransaction begin];
    self.progressLayer.path = _path.CGPath;
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [CATransaction setAnimationDuration:0.5];
    self.progressLayer.strokeEnd =  number / 100.0;
    self.titleLable.text = [NSString stringWithFormat:@"%lu%%",(unsigned long)number];
    [CATransaction commit];
}

//- (void)setImageURL:(NSString *)url{
//    
//    CGRect frame = self.frame;
//    self.layer.cornerRadius = frame.size.width / 2;
//    self.layer.masksToBounds = YES;
//    self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
//    [self addSubview:self.imageView];
//}



@end
