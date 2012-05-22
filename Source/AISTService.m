/* 
 * Steamium is the legal property of its developers, whose names are listed in the copyright file included
 * with this source distribution.
 * 
 * This program is free software; you can redistribute it and/or modify it under the terms of the GNU
 * General Public License as published by the Free Software Foundation; either version 2 of the License,
 * or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
 * the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
 * Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along with this program; if not,
 * write to the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

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
