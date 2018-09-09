//
//  HGPrintTool.h
//  HGTools
//
//  Created by CoderHG on 2018/9/9.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const NSString *HGPrintColorDefault;

extern const NSString *HGPrintColorFolder;
extern const NSString *HGPrintColorFile;

extern const NSString *HGPrintColorTip;

@interface HGPrintTool : NSObject

+ (void)print:(NSString *)format, ...;
+ (void)printFolder:(NSString *)format, ...;
+ (void)printFile:(NSString *)format, ...;


+ (void)printColor:(NSString *)color format:(NSString *)format, ...;

@end
