//
//  ZMJViewController.m
//  ZMJImageEditor
//
//  Created by keshiim on 04/01/2017.
//  Copyright (c) 2017 keshiim. All rights reserved.
//

#import "ZMJViewController.h"
#import "WBGImageEditor.h"
#import "WBGMoreKeyboardItem.h"
#import "YYWebImage.h"


@interface ZMJViewController () <WBGImageEditorDelegate, WBGImageEditorDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ZMJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    NSURL *url = [NSURL URLWithString:@"https://piccdn.cymini.qq.com:443/cy_article/0/fa973800868864f0e4a342a684a1dc86/0?tp=webp"];
    
//    [_imageView
//     yy_setImageWithURL:url
//     placeholder:nil
//     options:0
//     completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error)
//    {
//        
//    }];
    
}

- (IBAction)editButtonAction:(UIBarButtonItem *)sender {
    if (self.imageView.image) {
        WBGImageEditor *editor = [[WBGImageEditor alloc] initWithImage:_imageView.image delegate:self dataSource:self];
        [self presentViewController:editor animated:YES completion:nil];
    } else {
        NSLog(@"木有图片");
    }
    
}

#pragma mark - WBGImageEditorDelegate
- (void)imageEditor:(WBGImageEditor *)editor didFinishEdittingWithImage:(UIImage *)image {
    self.imageView.image = image;
    [editor.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)imageEditorDidCancel:(WBGImageEditor *)editor {
    
}

#pragma mark - WBGImageEditorDataSource
- (NSArray<WBGMoreKeyboardItem *> *)imageItemsEditor:(WBGImageEditor *)editor {
    return @[
             [WBGMoreKeyboardItem createByTitle:@"p1" imagePath:@"p1" image:[UIImage imageNamed:@"p1"]],
             [WBGMoreKeyboardItem createByTitle:@"p2" imagePath:@"p2" image:[UIImage imageNamed:@"p2"]],
             [WBGMoreKeyboardItem createByTitle:@"p1" imagePath:@"p1" image:[UIImage imageNamed:@"p1"]],
             [WBGMoreKeyboardItem createByTitle:@"p2" imagePath:@"p2" image:[UIImage imageNamed:@"p2"]],
             [WBGMoreKeyboardItem createByTitle:@"p1" imagePath:@"p1" image:[UIImage imageNamed:@"p1"]],
             [WBGMoreKeyboardItem createByTitle:@"p2" imagePath:@"p2" image:[UIImage imageNamed:@"p2"]],
             [WBGMoreKeyboardItem createByTitle:@"p1" imagePath:@"p1" image:[UIImage imageNamed:@"p1"]],
             [WBGMoreKeyboardItem createByTitle:@"p2" imagePath:@"p2" image:[UIImage imageNamed:@"p2"]],
             [WBGMoreKeyboardItem createByTitle:@"p1" imagePath:@"p1" image:[UIImage imageNamed:@"p1"]],
             [WBGMoreKeyboardItem createByTitle:@"p2" imagePath:@"p2" image:[UIImage imageNamed:@"p2"]]
             ];
}

- (WBGImageEditorComponent)imageEditorCompoment {
    return WBGImageEditorALLComponent;
}

- (UIColor *)imageEditorDefaultColor {
    return UIColor.redColor;
}

- (NSNumber *)imageEditorDrawPathWidth {
    return @(5.f);
}
#pragma mark - ------line------
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
