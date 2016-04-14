//
//  XWDownSheet.h
//  XWImagePickDemo
//
//  Created by 邱学伟 on 16/4/14.
//  Copyright © 2016年 邱学伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XWDownSheetCell.h"

@protocol XWDownSheetDelegate <NSObject>

@optional
-(void)didSelectIndex:(NSInteger)index;

@end

@interface XWDownSheet : UIView{
    UITableView *view;
    NSArray *listData;
}
-(id)initWithlist:(NSArray *)list height:(CGFloat)height;
- (void)showInView:(UIViewController *)Sview;
@property(nonatomic,assign) id <XWDownSheetDelegate> delegate;

@end
