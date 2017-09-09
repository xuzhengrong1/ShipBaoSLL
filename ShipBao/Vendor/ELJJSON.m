//
//  AppDelegate.h
//  ELJShareTogether
//
//  Created by Xuzhengrong on 16/7/1.
//  Copyright © 2016年 elenjoy. All rights reserved.
//

#import "ELJJSON.h"

@implementation ELJJSON


+ (id)JSONValue:(NSString *)string
{
    NSData* data = [string dataUsingEncoding:NSUTF8StringEncoding];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

+ (NSString *)JSONString:(id)obj
{
    if (!obj) {
        return nil;
    }
    
    NSError* error = nil;
    NSData *result = [NSJSONSerialization dataWithJSONObject:obj
                                                options:kNilOptions error:&error];
    
    if (error != nil) {
        return nil;
    }
    
    NSString *jsonString = [[NSString alloc] initWithData:result
                                                 encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end
