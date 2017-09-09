//
//  AppDelegate.h
//  ELJShareTogether
//
//  Created by Xuzhengrong on 16/7/1.
//  Copyright © 2016年 elenjoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELJJSON : NSObject

+ (id)JSONValue:(NSString *)string;

+ (NSString *)JSONString:(id)obj;

@end
