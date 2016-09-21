//  Created by Michael Kirk on 9/21/16.
//  Copyright © 2016 Open Whisper Systems. All rights reserved.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class TSContactThread;

@interface OWSContactInfoTableViewController : UITableViewController

- (void)configureWithContactThread:(TSContactThread *)thread;
- (void)presentedModalWasDismissed;

@end

NS_ASSUME_NONNULL_END
