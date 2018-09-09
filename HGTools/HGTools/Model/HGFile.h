//
//  HGFile.h
//  HGTools
//
//  Created by CoderHG on 2018/9/9.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HGFile : NSObject

+ (instancetype)fileWithName:(NSString*)name;

/** 文件名 */
@property (nonatomic, copy, readonly) NSString* name;

/** 文件类型 */
@property (nonatomic, assign, getter=isDir) BOOL dir;

@end
