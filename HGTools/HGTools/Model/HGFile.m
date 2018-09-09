//
//  HGFile.m
//  HGTools
//
//  Created by CoderHG on 2018/9/9.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "HGFile.h"

@implementation HGFile

+ (instancetype)fileWithName:(NSString *)name {
    HGFile* file = [self new];
    file->_name = name.copy;
    return file;
}

@end
