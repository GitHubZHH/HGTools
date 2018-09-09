//
//  HGFileTool.h
//  HGTools
//
//  Created by CoderHG on 2018/9/9.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import <Foundation/Foundation.h>

// 搜索文件的类型
typedef enum {
    HGFileToolListTypeAll,
    HGFileToolListTypeFolder,
    HGFileToolListTypeFile
} HGFileToolType;

@interface HGFileTool : NSObject

+ (void)listFilesWithType:(HGFileToolType)type
                    regex:(NSString *)regex
                operation:(void (^)(NSArray *files))operation;

@end
