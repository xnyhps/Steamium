//
//  AISTPlugin.m
//  Steamium
//
//  Created by Thijs Alkemade on 22-05-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AISTPlugin.h"
#import <Adium/ESDebugAILog.h>
#import "AISTService.h"
#import "libsteam.h"

extern void purple_init_steam_plugin();

@implementation AISTPlugin

- (void)installPlugin
{
	AILogWithSignature(@"Loaded");
	purple_init_steam_plugin();
	[AISTService registerService];
}

- (void)uninstallPlugin
{
	
}

@end
