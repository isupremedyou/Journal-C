//
//  TCEntryController.h
//  Journal-C
//
//  Created by Travis Chapman on 10/30/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TCEntry.h"

@interface TCEntryController : NSObject

// Shared Truth
@property (nonatomic) NSMutableArray<TCEntry *> *entries;

// Shared Instance
+ (TCEntryController *) shared;

- (void) addEntryWith:(TCEntry *)entry;
- (void) updateWith:(TCEntry *)entry newTitle:(NSString *)newTitle newBody:(NSString *)newBody;
- (void) removeEntryWith:(TCEntry *)entry;

- (void) saveToPersistentStorage;
- (void) loadFromPersistentStorage;

@end
