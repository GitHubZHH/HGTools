//
//  HGPrintTool.m
//  HGTools
//
//  Created by CoderHG on 2018/9/9.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "HGPrintTool.h"

const NSString *HGPrintColorDefault = @"\033[0m";

const NSString *HGPrintColorFolder = @"\033[1;31m";
const NSString *HGPrintColorFile = @"\033[1;32m";

const NSString *HGPrintColorTip = @"\033[1;36m";

#define HGBeginFormat \
if (!format) return; \
va_list args; \
va_start(args, format); \
format = [[NSString alloc] initWithFormat:format arguments:args];

#define HGEndFormat va_end(args);


@implementation HGPrintTool

+ (void)print:(NSString *)format, ...
{
    HGBeginFormat;
    [self printColor:nil format:format];
    HGEndFormat;
}

+ (void)printFolder:(NSString *)format, ...
{
    HGBeginFormat;
    format = [@"Folder: " stringByAppendingString:format];
    [self printColor:(NSString *)HGPrintColorFolder format:format];
}

+ (void)printFile:(NSString *)format, ...
{
    HGBeginFormat;
    format = [@"File: " stringByAppendingString:format];
    [self printColor:(NSString *)HGPrintColorFile format:format];
    HGEndFormat;
}

+ (void)printColor:(NSString *)color format:(NSString *)format, ...
{
    HGBeginFormat;
    
    NSMutableString *printStr = [NSMutableString string];
    if (color && ![color isEqual:HGPrintColorDefault]) {
        [printStr appendString:color];
        [printStr appendString:format];
        [printStr appendString:(NSString *)HGPrintColorDefault];
    } else {
        [printStr appendString:(NSString *)HGPrintColorDefault];
        [printStr appendString:format];
    }
    printf("%s", printStr.UTF8String);
    
    HGEndFormat;
}

@end
