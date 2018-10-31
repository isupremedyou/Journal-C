//
//  TCEntry.m
//  Journal-C
//
//  Created by Travis Chapman on 10/30/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

#import "TCEntry.h"

@implementation TCEntry

- (instancetype)initWithTitle:(NSString *)title body:(NSString *)body timestamp:(NSDate *)timestamp
{
    self = [super init];
    if (self) {
        _title = title;
        _body = body;
        if (timestamp == nil) {
            _timestamp = [[NSDate alloc] init];
        } else {
            _timestamp = timestamp;
        }
    }
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    
    NSString *title = [dictionary valueForKey:@"title"];
    NSString *body = [dictionary valueForKey:@"body"];
    NSDate *timestamp = [dictionary valueForKey:@"timestamp"];
    
    return [[TCEntry alloc] initWithTitle:title body:body timestamp:timestamp];
}

- (NSDictionary *)dictionaryCopy:(TCEntry *)entry
{
    static NSString * const titleKey = @"title";
    static NSString * const bodyKey = @"body";
    static NSString * const timestampKey = @"timestamp";
    
    return [[NSDictionary alloc] initWithObjectsAndKeys:entry.title, titleKey, entry.body, bodyKey, entry.timestamp, timestampKey, nil];
}

@end
