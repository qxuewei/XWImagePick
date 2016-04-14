//
//  XWImagePicker.h
//  XWImagePickDemo
//
//  Created by 邱学伟 on 16/4/14.
//  Copyright © 2016年 邱学伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 *  选择完图片回调
 */
typedef void (^PickCallback)(UIImage * image);

@interface XWImagePicker : NSObject

/**
 *  单例对象
 */
+(instancetype)shareInstance;

/**
 *   展示照片选择器
 *
 *  @param controller 当前控制器
 *  @param callback   回调方法
 *  @param animated   动画
 */
-(void)showWithController:(UIViewController *)controller finished:(PickCallback)callback animated:(BOOL)animated;

@end
