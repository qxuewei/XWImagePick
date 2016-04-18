# XWImagePick
头像的选择，照片选择器，图片选择封装类
<br>演示效果</br>
![](https://github.com/qxuewei/XWImagePick/raw/master/GIF/imagePickGif.gif)  
使用方法:

<code><pre>
    [[XWImagePicker shareInstance] showWithController:self finished:^(UIImage *image) {
        NSLog(@"获得图片进行相应的操作... image=%@",image);
    } animated:YES];
</code></pre>