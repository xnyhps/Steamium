//
//  AISTSteamAccount.m
//  Steamium
//
//  Created by Thijs Alkemade on 22-05-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AISTSteamAccount.h"

@implementation AISTSteamAccount

- (const char*)protocolPlugin
{
	return "prpl-steam-mobile";
}

- (NSString *)host
{
	return @"steamcommunity.com";
}

@end
