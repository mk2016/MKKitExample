//
//  MKImageBrowser.m
//  MKKitExample
//
//  Created by xmk on 2017/2/16.
//  Copyright © 2017年 mk. All rights reserved.
//

#import "MKImageBrowser.h"

#define MKIBImageViewMargin 10

@interface MKImageBrowser()<UIScrollViewDelegate>{
    
}

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIColor *backgroundColor; /*!< 背景色 */
@property (nonatomic, assign ) NSInteger currentIndex;  /*!< 当前 index */
@property (nonatomic, assign ) NSInteger imageCount;    /*!< 图片总数 */

@property (nonatomic, assign) BOOL showTopPageLabel;
@property (nonatomic , strong) UILabel *pageLabel;

/** pageControlDot */
@property (nonatomic, assign) BOOL hidesForSinglePage;
@property (nonatomic, assign) CGSize pageControlDotSize;
@property (nonatomic, assign) MKIBPageControlAlignment pageControlAlignment;
@property (nonatomic, strong) UIColor *pageDotSelectedColor;
@property (nonatomic, strong) UIColor *pageDotColor;

@property (nonatomic, strong) UIImage *pageDotSelectedImage;
@property (nonatomic, strong) UIImage *pageDotImage;

@property (nonatomic , strong) UIControl *pageControl;

@property (nonatomic, strong) UIImageView *clickedImageView;

@end

@implementation MKImageBrowser

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initData];
    }
    return self;
}

/** 属性 初始化 */
- (void)initData{
    self.backgroundColor = self.backgroundColor;
    self.pageControlAlignment = MKIBPageControlAlignmentCenter;
    self.pageControlDotSize = CGSizeMake(10, 10);
    self.hidesForSinglePage = YES;
    self.pageDotColor = [UIColor lightGrayColor];
    self.pageDotSelectedColor = [UIColor whiteColor];
}


- (void)show{
    if (self.imageCount <= 0) {
        return;
    }
    if (self.currentIndex >= self.imageCount) {
        self.currentIndex = self.imageCount - 1;
    }
    if (self.currentIndex < 0) {
        self.currentIndex  = 0;
    }
    
    UIWindow *window = [MKUIHelper getTopFullWindow];
    self.frame = window.bounds;
    self.alpha = 0.0f;
    [window addSubview:self];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    [self setupUI];
}

- (void)dismiss{
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)setupUI{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = self.bounds;
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.contentSize = CGSizeMake(self.bounds.size.width * self.imageCount, self.bounds.size.height);
    [self addSubview:self.scrollView];
    self.scrollView.contentOffset = CGPointMake(self.currentIndex * (self.scrollView.bounds.size.width), 0);
    
    [self setupPageControl];
    
    if (self.showTopPageLabel) {
        UILabel *pageLabel = [[UILabel alloc] init];
        pageLabel.bounds = CGRectMake(0, 0, 80, 30);
        pageLabel.center = CGPointMake(MKSCREEN_WIDTH * 0.5, 35);
        pageLabel.textColor = [UIColor whiteColor];
        pageLabel.textAlignment = NSTextAlignmentCenter;
        pageLabel.font = [UIFont systemFontOfSize:18];
        pageLabel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        pageLabel.layer.cornerRadius = pageLabel.bounds.size.height *0.5;
        pageLabel.clipsToBounds = YES;
        [self addSubview:pageLabel];
        self.pageLabel = pageLabel;
    }
    [self showFirstImage];
}

- (void)showFirstImage{
    if (self.clickedImageView) {
        
    }
}

- (void)setupPageControl{
    
    if (_pageControl) {
        [_pageControl removeFromSuperview];
    }
    if ((self.imageCount <= 1 && self.hidesForSinglePage) || self.pageControlAlignment == MKIBPageControlAlignmentNone) {
        return;
    }
    
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = self.imageCount;
    pageControl.pageIndicatorTintColor = self.pageDotColor;
    pageControl.currentPageIndicatorTintColor = self.pageDotSelectedColor;
    pageControl.userInteractionEnabled = NO;
    pageControl.currentPage = self.currentIndex;
    [self addSubview:pageControl];
    self.pageControl = pageControl;
    
    
    CGSize size = CGSizeMake(self.imageCount * self.pageControlDotSize.width * 1.2, self.pageControlDotSize.height);
    if (self.pageControlAlignment == MKIBPageControlAlignmentCenter){
        self.pageControl.frame = CGRectMake((MKSCREEN_WIDTH-size.width)/2, MKSCREEN_HEIGHT-30, size.width, size.height);
    }else if (self.pageControlAlignment == MKIBPageControlAlignmentLeft){
        self.pageControl.frame = CGRectMake(20, MKSCREEN_HEIGHT-30, size.width, size.height);
    }else if (self.pageControlAlignment == MKIBPageControlAlignmentRight){
        self.pageControl.frame = CGRectMake(MKSCREEN_WIDTH-size.width-20, MKSCREEN_HEIGHT-30, size.width, size.height);
    }
    

}

- (void)updatePageControlIndex{
    if (self.imageCount == 1 && self.hidesForSinglePage == YES ) {
        self.pageLabel.hidden = YES;
        self.pageControl.hidden = YES;
        return;
    }
    
    ((UIPageControl *)self.pageControl).currentPage = self.currentIndex;
    NSString *title = [NSString stringWithFormat:@"%ld / %ld", self.currentIndex+1, self.imageCount];
    self.pageLabel.text = title;
    
}

#pragma mark - ***** lazy *****
- (UIColor *)backgroundColor{
    if (!_backgroundColor) {
        _backgroundColor = [UIColor blackColor];
    }
    return _backgroundColor;
}
@end
