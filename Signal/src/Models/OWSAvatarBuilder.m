//  Created by Michael Kirk on 9/22/16.
//  Copyright © 2016 Open Whisper Systems. All rights reserved.

#import "OWSAvatarBuilder.h"
#import "OWSContactsManager.h"
#import "UIColor+OWS.h"
#import "UIFont+OWS.h"
#import <JSQMessagesViewController/JSQMessagesAvatarImageFactory.h>

NS_ASSUME_NONNULL_BEGIN

@interface OWSAvatarBuilder ()

@property (nonatomic, readonly) OWSContactsManager *contactsManager;
@property (nonatomic, readonly) NSString *signalId;
@property (nonatomic, readonly) NSString *contactName;

@end

@implementation OWSAvatarBuilder

- (instancetype)initWithContactsManager:(OWSContactsManager *)contactsManager
                               signalId:(NSString *)signalId
                            contactName:(NSString *)contactName
{
    self = [super init];
    if (!self) {
        return self;
    }

    _contactsManager = contactsManager;
    _signalId = signalId;
    _contactName = contactName;

    return self;
}

- (UIImage *)buildDefaultImage
{
    NSMutableString *initials = [NSMutableString string];

    if (self.contactName.length > 0) {
        NSArray *words =
            [self.contactName componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        for (NSString *word in words) {
            if (word.length > 0) {
                NSString *firstLetter = [word substringToIndex:1];
                [initials appendString:[firstLetter uppercaseString]];
            }
        }
    }

    NSRange stringRange = { 0, MIN([initials length], (NSUInteger)3) }; // Rendering max 3 letters.
    initials = [[initials substringWithRange:stringRange] mutableCopy];

    UIColor *backgroundColor = [UIColor backgroundColorForContact:self.signalId];

    return [[JSQMessagesAvatarImageFactory avatarImageWithUserInitials:initials
                                                       backgroundColor:backgroundColor
                                                             textColor:[UIColor whiteColor]
                                                                  font:[UIFont ows_boldFontWithSize:36.0]
                                                              diameter:100] avatarImage];
}

- (UIImage *)build
{
    UIImage *image = [self.contactsManager imageForPhoneIdentifier:self.signalId];
    if (!image) {
        image = [self buildDefaultImage];
    }

    return image;
}

@end

NS_ASSUME_NONNULL_END
