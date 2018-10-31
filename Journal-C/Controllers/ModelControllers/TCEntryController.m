//
//  TCEntryController.m
//  Journal-C
//
//  Created by Travis Chapman on 10/30/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

#import "TCEntryController.h"

@implementation TCEntryController

+ (TCEntryController *) shared {
    static TCEntryController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [TCEntryController new];
    });
    return shared;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _entries = [NSMutableArray new];
        [self loadFromPersistentStorage];
    }
    return self;
}

- (void)addEntryWith:(TCEntry *)entry
{
    [_entries addObject:entry];
    [TCEntryController.shared saveToPersistentStorage];
}

- (void)updateWith:(TCEntry *)entry newTitle:(NSString *)newTitle newBody:(NSString *)newBody
{
    NSInteger index = [_entries indexOfObject:entry];
    _entries[index].title = newTitle;
    _entries[index].body = newBody;
    
    [TCEntryController.shared saveToPersistentStorage];
}

- (void)removeEntryWith:(TCEntry *)entry
{
    
    [_entries removeObject:entry];
    [TCEntryController.shared saveToPersistentStorage];
}

- (void)saveToPersistentStorage
{
    NSMutableArray *entriesAsDictionaries = [NSMutableArray new];
    
    for (TCEntry *entry in _entries) {
        
        NSDictionary *dictionary = [entry dictionaryCopy:entry];
        [entriesAsDictionaries addObject:dictionary];
    }

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:entriesAsDictionaries forKey:@"entries"];
    [defaults synchronize];
}

- (void)loadFromPersistentStorage
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *entriesAsDictionaries = [defaults objectForKey:@"entries"];
    
    for (NSDictionary *entryDict in entriesAsDictionaries) {
        
        TCEntry *entry = [[TCEntry alloc] initWithDictionary:entryDict];
        [_entries addObject:entry];
    }
}

@end
