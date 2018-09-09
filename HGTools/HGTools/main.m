//
//  main.m
//  HGTools
//
//  Created by CoderHG on 2018/9/9.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HGFileTool.h"
#import "HGFile.h"
#import "HGPrintTool.h"

void print_usage(void);
void list_files(HGFileToolType type, NSString *regex);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        // 参数不够
        if (argc == 1) {
            print_usage();
            return 0;
        }
        
        const char *firstArg = argv[1];
        if (firstArg[0] == '-' && firstArg[1] == 'l') {
            NSString *regex = nil;
            if (argc > 2) {
                regex = [NSString stringWithUTF8String:argv[2]];
            }
            
            if (strcmp(firstArg, "-lfi") == 0) {
                list_files(HGFileToolListTypeFile, regex);
            } else if (strcmp(firstArg, "-lfd") == 0) {
                list_files(HGFileToolListTypeFolder, regex);
            }  else {
                list_files(HGFileToolListTypeAll, regex);
            }
        } else {
            // 不符合规范
            print_usage();
        }
    }
    return 0;
}

// help
void print_usage(void) {
    {
        [HGPrintTool printColor:(NSString*)HGPrintColorTip format:@"  -l  <regex>"];
        [HGPrintTool print:@"\t列出桌面所有的"];
        [HGPrintTool printColor:(NSString *)HGPrintColorFolder format:@"目录"];
        [HGPrintTool print:@"与"];
        [HGPrintTool printColor:(NSString *)HGPrintColorFile format:@"文件\n"];
    }
    
    {
        [HGPrintTool printColor:(NSString*)HGPrintColorTip format:@"  -lfd  <regex>"];
        [HGPrintTool print:@"\t列出桌面所有的"];
        [HGPrintTool printColor:(NSString *)HGPrintColorFolder format:@"目录\n"];
    }
    
    {
        [HGPrintTool printColor:(NSString*)HGPrintColorTip format:@"  -lfi  <regex>"];
        [HGPrintTool print:@"\t列出桌面所有的"];
        [HGPrintTool printColor:(NSString *)HGPrintColorFile format:@"文件\n"];
    }
}

void list_files(HGFileToolType type, NSString *regex) {
    [HGFileTool listFilesWithType:type regex:regex operation:^(NSArray *files) {
        [HGPrintTool print:@"一共有 "];
        [HGPrintTool printColor:(NSString*)HGPrintColorTip format:@"[%02d]", files.count];
        [HGPrintTool print:@" 个文件\n"];
        
        for (int i=0; i<files.count; i++) {
            [HGPrintTool printColor:(NSString*)HGPrintColorTip format:@"[%02d] ", (i+1)];
            
            HGFile* file = files[i];
            if (file.isDir) {
                [HGPrintTool printFolder:@"%@\n", file.name];
            } else {
                [HGPrintTool printFile:@"%@\n", file.name];
            }
        }
    }];
}
