//
//  XWDownSheetCell.h
//  XWImagePickDemo
//
//  Created by 邱学伟 on 16/4/14.
//  Copyright © 2016年 邱学伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XWDownSheetModel.h"

//自定义颜色rgba
#define ColorWithRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/1.0] //<<< 用10进制表示颜色，例如（255,255,255）黑色

//屏幕尺寸 kScreenWidth:屏幕宽度    kScreenHeight：屏幕高度
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


@interface XWDownSheetCell : UITableViewCell
{
    UIImageView *leftView;
    UILabel *InfoLabel;
    XWDownSheetModel *cellData;
    UIView *backgroundView;
    
}
-(void)setData:(XWDownSheetModel *)dicData;
@end
