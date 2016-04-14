//
//  XWDownSheet.m
//  XWImagePickDemo
//
//  Created by 邱学伟 on 16/4/14.
//  Copyright © 2016年 邱学伟. All rights reserved.
//

#import "XWDownSheet.h"

#define KNavitionBarHeight 64

@interface XWDownSheet()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>
/**
 *  是否透明
 */
@property (nonatomic, assign) BOOL isTranslucent;
@end

@implementation XWDownSheet
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(id)initWithlist:(NSArray *)list height:(CGFloat)height{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        self.backgroundColor = ColorWithRGBA(0, 0, 0, .7);
        view = [[UITableView alloc] initWithFrame:CGRectMake(0, kScreenHeight, kScreenWidth, 49 * [list count] + 7) style:UITableViewStylePlain];
        view.dataSource = self;
        view.delegate = self;
        view.separatorStyle = NO;
        listData = list;
        view.scrollEnabled = NO;
        [self addSubview:view];
    }
    return self;
}

-(void)showInView:(UIViewController *)Sview{
    if (Sview == nil) {
        
    }else{
        self.isTranslucent = !Sview.navigationController.navigationBar.isTranslucent && Sview.navigationController.navigationBar;
        [Sview.view addSubview:self];
    }
    [self animeData];
}

-(void)animeData{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedCancel)];
    [self addGestureRecognizer:tap];
    tap.delegate = self;
    CGFloat orginY = kScreenHeight - view.frame.size.height;
    if (self.isTranslucent) {
        orginY -= KNavitionBarHeight;
    }
    [UIView animateWithDuration:.25 animations:^{
        self.backgroundColor = ColorWithRGBA(0, 0, 0, .7);
        [UIView animateWithDuration:.25 animations:^{
            [view setFrame:CGRectMake(view.frame.origin.x, orginY, view.frame.size.width, view.frame.size.height)];
        } completion:^(BOOL finished) {
            
        }];
    } completion:^(BOOL finished) {
        
    }];
    
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if([touch.view isKindOfClass:[self class]]){
        return YES;
    }
    return NO;
}

-(void)tappedCancel{
    [UIView animateWithDuration:.25 animations:^{
        [view setFrame:CGRectMake(0, kScreenHeight, kScreenWidth, 0)];
        [view setAlpha:0];
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}

#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [listData count]+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    if(indexPath.row == listData.count-1){
        UITableViewCell*  cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"gap"];
        cell.contentView.backgroundColor = ColorWithRGBA(214, 214, 221,1);
        return cell;
    }else {
        
        XWDownSheetCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if(cell==nil){
            
            cell = [[XWDownSheetCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        if (indexPath.row == listData.count) {
            [cell setData:[listData objectAtIndex:listData.count-1]];
        }else {
            [cell setData:[listData objectAtIndex:indexPath.row]];
        }
        
        return cell;
    }
    
    
    
    
    
    // Configure the cell...
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self tappedCancel];
    if(_delegate!=nil && [_delegate respondsToSelector:@selector(didSelectIndex:)]){
        [_delegate didSelectIndex:indexPath.row];
        
        return;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == listData.count-1){
        return 7;
    }else{
        return 49;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
