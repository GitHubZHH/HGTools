//
//  HGFileTool.m
//  HGTools
//
//  Created by CoderHG on 2018/9/9.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "HGFileTool.h"
#import "HGFile.h"

@implementation HGFileTool

+ (void)listFilesWithType:(HGFileToolType)type regex:(NSString *)regex operation:(void (^)(NSArray *fs))operation {
    if (!operation) {
        operation(nil);
        return;
    }
    
    // 正则
    NSRegularExpression *exp = regex ? [NSRegularExpression regularExpressionWithPattern:regex options:NSRegularExpressionCaseInsensitive error:nil] : nil;
    
#warning 打开这行注释 写下你的桌面路径即可
    // 桌面路径
    // NSString* dirString = @"~/Desktop";
    
    // 文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray* files = [fileManager contentsOfDirectoryAtPath:dirString error:NULL];
    
    NSMutableArray* filesM = [NSMutableArray array];
    for (int i=0; i<files.count; i++) {
        NSString* name = files[i];
        HGFile* file = [HGFile fileWithName:name];
        
        NSString* fullPath = [NSString stringWithFormat:@"%@/%@", dirString, name];
        
        // 是否为目录
        BOOL isDir = NO;
        [fileManager fileExistsAtPath:fullPath isDirectory:&isDir];
        
        // 模拟 grep 功能
        if (![self mach:file exp:exp]) continue;
        
        // 过滤
        if (isDir && (type == HGFileToolListTypeFile)) continue;
        if (!isDir && (type == HGFileToolListTypeFolder)) continue;
        
        file.dir = isDir;
        [filesM addObject:file];
    }
    
    // 回调
    operation(filesM.copy);
}

// 匹配
+ (BOOL)mach:(HGFile*)file exp:(NSRegularExpression *)exp {
    if (!exp) {
        return YES;
    }
    return !![exp firstMatchInString:file.name options:0 range:NSMakeRange(0, file.name.length)];
}

@end
