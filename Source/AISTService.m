//
//  AISTService.m
//  Steamium
//
//  Created by Thijs Alkemade on 22-05-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AISTService.h"
#import "AISTSteamAccount.h"
#import <Adium/AIStatusControllerProtocol.h>

@implementation AISTService

//Account Creation
- (Class)accountClass{
	return [AISTSteamAccount class];
}

//- (AIAccountViewController *)accountViewController{
//    return nil; // [AISTSteamAccountViewController accountViewController];
//}
//
//- (DCJoinChatViewController *)joinChatView{
//	return nil; // [AISTSteamAccountJoinChatViewController joinChatView];
//}

//Service Description
- (NSString *)serviceCodeUniqueID{
	return @"libpurple-OpenSteamworks";
}
- (NSString *)serviceID{
	return @"Steam";
}
- (NSString *)serviceClass{
	return @"Steam";
}
- (NSString *)shortDescription{
	return @"Steam";
}
- (NSString *)longDescription{
	return @"Steam Chat";
}
- (NSCharacterSet *)allowedCharacters{
	return [NSCharacterSet characterSetWithCharactersInString:@"+abcdefghijklmnopqrstuvwxyz0123456789@._-"];
}
- (NSUInteger)allowedLength{
	return 113;
}
- (BOOL)caseSensitive{
	return NO;
}
- (AIServiceImportance)serviceImportance{
	return AIServiceSecondary;
}
- (NSString *)userNameLabel{
    return NSLocalizedString(@"Account name","");    //Sign-in name
}

- (void)registerStatuses{
	[adium.statusController registerStatus:STATUS_NAME_AVAILABLE
						   withDescription:[adium.statusController localizedDescriptionForCoreStatusName:STATUS_NAME_AVAILABLE]
									ofType:AIAvailableStatusType
								forService:self];
	
	[adium.statusController registerStatus:STATUS_NAME_AWAY
						   withDescription:[adium.statusController localizedDescriptionForCoreStatusName:STATUS_NAME_AWAY]
									ofType:AIAwayStatusType
								forService:self];
	
	[adium.statusController registerStatus:STATUS_NAME_EXTENDED_AWAY
						   withDescription:[adium.statusController localizedDescriptionForCoreStatusName:STATUS_NAME_EXTENDED_AWAY]
									ofType:AIAwayStatusType
								forService:self];
	
	[adium.statusController registerStatus:STATUS_NAME_BUSY
						   withDescription:[adium.statusController localizedDescriptionForCoreStatusName:STATUS_NAME_BUSY]
									ofType:AIAwayStatusType
								forService:self];
}

- (NSImage *)defaultServiceIconOfType:(AIServiceIconType)iconType
{
	if (iconType == AIServiceIconLarge) {
		return [[[NSImage alloc] initWithContentsOfFile:[[NSBundle bundleForClass:[self class]] pathForImageResource:@"large"]] autorelease];
	}
	
	return [[[NSImage alloc] initWithContentsOfFile:[[NSBundle bundleForClass:[self class]] pathForImageResource:@"small"]] autorelease];
}

- (NSString *)pathForDefaultServiceIconOfType:(AIServiceIconType)iconType
{
	
	if (iconType == AIServiceIconLarge) {
		return [[NSBundle bundleForClass:[self class]] pathForImageResource:@"large"];
	}
	
	return [[NSBundle bundleForClass:[self class]] pathForImageResource:@"small"];
}

@end
