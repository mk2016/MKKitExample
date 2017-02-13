//
//  TestModel.h
//  MKKitExample
//
//  Created by xmk on 2017/2/13.
//  Copyright © 2017年 mk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *phone;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, assign) BOOL gender;
@property (nonatomic, strong) NSArray *array;
@end
