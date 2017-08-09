//
//  MKBrowserTest_VC.m
//  MKKitExample
//
//  Created by xmk on 2017/2/17.
//  Copyright © 2017年 mk. All rights reserved.
//

#import "MKBrowserTest_VC.h"
#import "MKImagesBrowser.h"

@interface MKBrowserTest_VC ()<MKImagesBrowserDataSource>
@property (nonatomic , strong) UIScrollView *scrollView;
@property (nonatomic , strong) NSMutableArray *images;
@property (nonatomic , strong) NSMutableArray *urlStrings;

@end

@implementation MKBrowserTest_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(15, 100, MKSCREEN_WIDTH-30, 100)];
    [self.view addSubview:self.scrollView];
    self.scrollView.backgroundColor = [UIColor grayColor];
    
    for (int i = 1; i <= 10; i ++) {
        NSString *str = [NSString stringWithFormat:@"photo%zd.jpg",i];
        UIImage *image = [UIImage imageNamed:str];
        [self.images addObject:image];
    }

    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    CGFloat imageWidth = 100;
    CGFloat margin = 10;
    for (int i = 0; i < self.images.count; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.tag = i;
        imgView.userInteractionEnabled = YES;
        imgView.frame = CGRectMake((imageWidth + margin)*i, 0, imageWidth, imageWidth);
        imgView.image = self.images[i];
        imgView.contentMode = UIViewContentModeScaleAspectFill;
        imgView.layer.masksToBounds = YES;
        [imgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)]];
        [self.scrollView addSubview:imgView];
    }
    self.scrollView.contentSize = CGSizeMake((imageWidth+margin)*self.images.count, 0);
}

- (void)clickImage:(UITapGestureRecognizer *)tap{
    MKImagesBrowser *browser = [[MKImagesBrowser alloc] init];
    browser.currentIndex = tap.view.tag;
    browser.dataSource = self;
//    browser.pageDotColor = [UIColor redColor];
//    browser.pageDotSelectedColor = [UIColor blueColor];
//    browser.pageDotImage = [UIImage imageNamed:@"public_select_0"];
//    browser.pageDotCurrentImage = [UIImage imageNamed:@"public_select_1"];
    browser.pageControlAlignment = MKIBPageControlAlignmentCenter;
    [browser show];
    browser.longPressblock = ^(MKImagesBrowser *browser, NSUInteger index){
        MKActionSheet *sheet = [[MKActionSheet alloc] initWithTitle:@"title" buttonTitles:@"1",@"2",@"3",@"4",@"5",@"6",@"7", nil];
        sheet.destructiveButtonIndex = 2;
        [sheet showWithBlock:^(MKActionSheet *actionSheet, NSInteger buttonIndex) {
            ELog(@" index : %ld", (long)buttonIndex);
        }];
        ELog(@"long on index : %zd", index);
    };
}

#pragma mark - ***** MKImagesBrowser delegate *****
- (UIImage *)imagesBrowser:(MKImagesBrowser *)browser sourceImageWithIndex:(NSInteger)index{
    if (index < self.images.count) {
        return [self.images objectAtIndex:index];
    }
    return nil;
}

- (UIImageView *)imagesBrowser:(MKImagesBrowser *)browser viewWithIndex:(NSInteger)index{
    if (index < self.scrollView.subviews.count) {
        return [self.scrollView.subviews objectAtIndex:index];
    }
    return nil;
}

- (NSString *)imagesBrowser:(MKImagesBrowser *)browser HDImageUrlWithIndex:(NSInteger)index{
    if (index < self.urlStrings.count) {
        return [self.urlStrings objectAtIndex:index];
    }
    return nil;
}

- (NSInteger)numberOfImagesInBrowser:(MKImagesBrowser *)browser{
//    return self.images.count;
    return self.urlStrings.count;
}


- (NSMutableArray *)images{
    if (!_images) {
        _images = @[].mutableCopy;
    }
    return _images;
}

- (NSMutableArray *)urlStrings{
    if (!_urlStrings) {
        _urlStrings = @[
                        @"https://raw.githubusercontent.com/mk2016/MKKitExample/master/Resource/photo/photo1.jpg",
                        @"https://raw.githubusercontent.com/mk2016/MKKitExample/master/Resource/photo/photo2.jpg",
                        @"https://raw.githubusercontent.com/mk2016/MKKitExample/master/Resource/photo/photo3.jpg",
                        @"https://raw.githubusercontent.com/mk2016/MKKitExample/master/Resource/photo/photo4.jpg",
                        @"https://raw.githubusercontent.com/mk2016/MKKitExample/master/Resource/photo/photo5.jpg",
                        @"https://raw.githubusercontent.com/mk2016/MKKitExample/master/Resource/photo/photo6.jpg",
                        @"https://raw.githubusercontent.com/mk2016/MKKitExample/master/Resource/photo/photo7.jpg",
                        @"https://raw.githubusercontent.com/mk2016/MKKitExample/master/Resource/photo/photo8.jpg",
                        @"https://raw.githubusercontent.com/mk2016/MKKitExample/master/Resource/photo/photo9.jpg",
                        @"https://raw.githubusercontent.com/mk2016/MKKitExample/master/Resource/photo/photo10.jpg",
                        
                        
//                        @"http://upload-images.jianshu.io/upload_images/1455933-e20b26b157626a5d.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
//                        @"http://upload-images.jianshu.io/upload_images/1455933-cb2abcce977a09ac.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
//                        @"http://upload-images.jianshu.io/upload_images/1455933-92be2b34e7e9af61.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
//                        @"http://upload-images.jianshu.io/upload_images/1455933-edd183910e826e8c.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
//                        @"http://upload-images.jianshu.io/upload_images/1455933-198c3a62a30834d6.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
//                        @"http://upload-images.jianshu.io/upload_images/1455933-e9e2967f4988eb7f.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
//                        @"http://upload-images.jianshu.io/upload_images/1455933-ce55e894fff721ed.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
//                        @"http://upload-images.jianshu.io/upload_images/1455933-5d3417fa034eafab.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
//                        @"http://upload-images.jianshu.io/upload_images/1455933-642e217fcdf15774.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
//                        @"http://upload-images.jianshu.io/upload_images/1455933-7245174910b68599.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
//                        @"http://upload-images.jianshu.io/upload_images/1455933-e74ae4df495938b7.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
//                        @"http://upload-images.jianshu.io/upload_images/1455933-ee53be08d63a0d22.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
//                        @"http://upload-images.jianshu.io/upload_images/1455933-412255ddafdde125.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
//                        @"http://upload-images.jianshu.io/upload_images/1455933-cee5618e9750de12.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
//                        @"http://upload-images.jianshu.io/upload_images/1455933-5d5d6ba05853700a.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
//                        @"http://upload-images.jianshu.io/upload_images/1455933-6dd4d281027c7749.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
                        ].mutableCopy;
    }
    return _urlStrings;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
