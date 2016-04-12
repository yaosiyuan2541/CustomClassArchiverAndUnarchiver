//
//  ViewController.m
//  iOSCustomClassArchiverAndUnarchiver
//
//  Created by 姚思远 on 16/4/12.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "CustomClass.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //执行归档操作
    CustomClass * customClass = [[CustomClass alloc]init];
    customClass.name = @"张三";
    customClass.age = 18;
    customClass.data = [NSData data];
    NSMutableData * data = [[NSMutableData alloc]init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:customClass forKey:@"customClass"];
    [archiver finishEncoding];
    [data writeToFile:[self filePath] atomically:YES];

    /*执行反归档操作*/
    [self unarchive];
}
/*反归档操作*/
- (void)unarchive
{
    
    NSData *data = [NSData dataWithContentsOfFile:[self filePath]];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    CustomClass *customClass = [unarchiver decodeObjectForKey:@"customClass"];/*会调用- (id)initWithCoder:(NSCoder *)aDecoder*/
    NSLog(@"%@,%d,%@",customClass.name,customClass.age,customClass.data);
    [unarchiver finishDecoding];/*解码结束*/
}
/*获取沙盒路径存储归档数据*/
- (NSString *)filePath
{
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *path = [docPath stringByAppendingPathComponent:@"CustomClass"];
    return path;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
