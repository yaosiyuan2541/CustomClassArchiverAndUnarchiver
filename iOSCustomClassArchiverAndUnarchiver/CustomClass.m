//
//  CustomClass.m
//  iOSCustomClassArchiverAndUnarchiver
//
//  Created by 姚思远 on 16/4/12.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "CustomClass.h"

@implementation CustomClass
/*编码方法*/
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    NSLog(@"编码");
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInt:self.age forKey:@"age"];
    [aCoder encodeObject:self.data forKey:@"data"];
}
/*解码方法*/
-(id)initWithCoder:(NSCoder *)aDecoder
{
    NSLog(@"解码");
    if (self==[super init]) {
        _name= [aDecoder decodeObjectForKey:@"name"];
        _age= (int)[aDecoder  decodeIntegerForKey:@"age"];
        _data = [aDecoder decodeObjectForKey:@"data"];
    }
    return self;
}
@end
