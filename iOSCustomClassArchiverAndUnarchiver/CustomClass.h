//
//  CustomClass.h
//  iOSCustomClassArchiverAndUnarchiver
//
//  Created by 姚思远 on 16/4/12.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomClass : NSObject<NSCoding>
@property(strong , nonatomic)NSString * name;
@property(assign , nonatomic)int age;
@property(strong , nonatomic)NSData * data;
@end
