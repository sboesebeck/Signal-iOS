//  Created by Michael Kirk on 9/22/16.
//  Copyright © 2016 Open Whisper Systems. All rights reserved.

NS_ASSUME_NONNULL_BEGIN

@class OWSContactsManager;

@interface OWSAvatarBuilder : NSObject

- (instancetype)initWithContactsManager:(OWSContactsManager *)contactsManager
                               signalId:(NSString *)signalId
                            contactName:(NSString *)contactName;

- (UIImage *)build;

@end

NS_ASSUME_NONNULL_END
