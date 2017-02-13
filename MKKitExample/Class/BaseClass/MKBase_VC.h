//
//  MKBase_VC.h
//  MKKit
//
//  Created by xmk on 2017/2/9.
//  Copyright © 2017年 mk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MKBase_VC : UIViewController

@property (nonatomic, copy) NSDictionary *routeParamDic;    /*!< 统跳路由传过来的解析后的字典 */
@property (nonatomic, copy) NSString *backImageName;        /*!< 返回按钮 名称 */
@property (nonatomic, assign) BOOL needBackBtn;             /*!< 是否需要返回按钮 */

/** 返回 */
- (void)backOnclick;

@end
