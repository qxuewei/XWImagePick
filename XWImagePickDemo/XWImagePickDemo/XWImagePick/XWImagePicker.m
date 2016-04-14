//
//  XWImagePicker.m
//  XWImagePickDemo
//
//  Created by 邱学伟 on 16/4/14.
//  Copyright © 2016年 邱学伟. All rights reserved.
//

#import "XWImagePicker.h"
#import "XWDownSheet.h"

@interface XWImagePicker ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,XWDownSheetDelegate>

@end

@implementation XWImagePicker{
    UIViewController *_screenController;
    NSArray *_pickList;
    PickCallback _callback;
    BOOL _animated;
}

+(instancetype)shareInstance{
    static XWImagePicker *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[XWImagePicker alloc] init];
        //设置数据
        instance->_pickList = [instance avaiablePickerSheetModel];
    });
    return instance;
}

-(void)showWithController:(UIViewController *)controller finished:(PickCallback)callback animated:(BOOL)animated{
    NSAssert(controller != nil, @"Controller can not be nil !");
    _callback = callback;
    _screenController = controller;
    _animated = animated;
    XWDownSheet *sheet = [[XWDownSheet alloc]initWithlist:_pickList height:330];
    sheet.delegate = self;
    [sheet showInView:controller];

}
//- (void)showWithController:(UIViewController *)controller
//                    finish:(PickCallback)callback
//                  animated:(BOOL)animated{
//    NSAssert(controller != nil, @"Controller can not be nil !");
//    _callback = callback;
//    _screenController = controller;
//    _animated = animated;
//    XWDownSheet *sheet = [[XWDownSheet alloc]initWithlist:_pickList height:330];
//    sheet.delegate = self;
//    [sheet showInView:controller];
//}

//设置数据
-(NSArray *)avaiablePickerSheetModel{
    XWDownSheetModel *Model_1 = [[XWDownSheetModel alloc]init];
    Model_1.title = @"拍照";
    XWDownSheetModel *Model_2 = [[XWDownSheetModel alloc]init];
    Model_2.title = @"从手机相册选择";
    XWDownSheetModel *Model_3 = [[XWDownSheetModel alloc]init];
    Model_3.title = @"取消";
    
    return   @[Model_1,Model_2,Model_3];
}

-(void)didSelectIndex:(NSInteger)index{
    if (index == 0) {
        //拍照[self openCamera:self];
        [self openCamera];
    }else if (index == 1){
        //相册 [self openPhotoLibrary:self];
        [self openPhotoLibrary];
    }else if (index == 2){
        
    }
}

#pragma mark - 打开相机
-(void)openCamera{
    
    NSUInteger sourceType = 0;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    
    sourceType = UIImagePickerControllerSourceTypeCamera; //照相机
    
    UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        pickerImage.sourceType = UIImagePickerControllerSourceTypeCamera;
        //pickerImage.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
        
    }
    pickerImage.sourceType = sourceType;
    pickerImage.delegate = self;
    pickerImage.allowsEditing = YES;
    [_screenController presentViewController:pickerImage animated:_animated completion:^{}];
}
#pragma mark 打开相册
- (void)openPhotoLibrary{
    NSUInteger sourceType = 0;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
        
    }
    
    UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        //pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        pickerImage.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
        
    }
    pickerImage.sourceType = sourceType;
    pickerImage.delegate = self;
    pickerImage.allowsEditing = YES;
    [_screenController presentViewController:pickerImage animated:_animated completion:^{}];
}
#pragma mark - Imagepicker delegte
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:_animated completion:^{
        UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
        if (_callback) {
            _callback(image);
        }
    }];
}

@end
