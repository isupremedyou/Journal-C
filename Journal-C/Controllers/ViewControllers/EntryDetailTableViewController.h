//
//  EntryDetailTableViewController.h
//  Journal-C
//
//  Created by Travis Chapman on 10/30/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCEntryController.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryDetailTableViewController : UITableViewController

@property (nonatomic) TCEntry *entry;

@end

NS_ASSUME_NONNULL_END
