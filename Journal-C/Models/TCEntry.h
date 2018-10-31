//
//  TCEntry.h
//  Journal-C
//
//  Created by Travis Chapman on 10/30/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCEntry : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *body;
@property (nonatomic, copy) NSDate *timestamp;

- (instancetype)initWithTitle:(NSString *)title body:(NSString *)body timestamp:(NSDate *)timestamp;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryCopy:(TCEntry *)entry;

@end

