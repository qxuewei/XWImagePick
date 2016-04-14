//
//  ViewController.m
//  XWImagePickDemo
//
//  Created by 邱学伟 on 16/4/14.
//  Copyright © 2016年 邱学伟. All rights reserved.
//

#import "ViewController.h"
#import "XWImagePicker.h"

@interface ViewController ()

@end

@implementation ViewController

/**
 *  选择图片监听方法
 */
- (IBAction)pickImageClick:(UIButton *)pickBtn {
    NSLog(@"选择图片->");
    [[XWImagePicker shareInstance] showWithController:self finished:^(UIImage *image) {
         NSLog(@"image=%@",image);
    } animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
