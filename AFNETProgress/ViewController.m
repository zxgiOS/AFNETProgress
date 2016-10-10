//
//  ViewController.m
//  AFNETProgress
//
//  Created by apple on 16/10/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "CircleProgressView.h"

@interface ViewController ()

@property (nonatomic,strong) CircleProgressView *PV;
@property (nonatomic,strong) UIView *meng;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (void)addProgressView{
    
    self.meng = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.meng.backgroundColor = [UIColor grayColor];
    self.meng.alpha = 0.8;
    [self.view bringSubviewToFront:self.meng];
    [self.view addSubview:self.meng];
    self.PV = [[CircleProgressView alloc] initWithFrame:CGRectMake(self.view.center.x-30, self.view.center.y-30, 60, 60)];
    [self.view addSubview:_PV];
}

- (void)removeProgressView{
    [self.meng removeFromSuperview];
    [self.PV removeFromSuperview];
    
}

- (IBAction)biginDown:(UIButton *)sender {
    [self addProgressView];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects: @"application/json", @"text/json", @"text/javascript",@"text/html",nil];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    http://192.168.1.251:9090/OA/uploadpic/1.jpg
//    http://192.168.1.55:8080/axpjpk/upload/666.ape
    AFHTTPRequestOperation *operation = [manager GET:@"http://192.168.1.251:9090/OA/uploadpic/1.jpg" parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
//        [self removeProgressView];
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"=======r%@",error.description);
    }];
    
    
    
    [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
       
        float p = (float)totalBytesRead/totalBytesExpectedToRead;
        NSLog(@"%f",p);
        
        [_PV updateProgressWithNumber:p*100];
        
    }];
    
}



@end
