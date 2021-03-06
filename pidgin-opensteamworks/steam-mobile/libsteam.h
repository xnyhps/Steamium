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

#ifndef LIBSTEAM_H
#define LIBSTEAM_H

/* Maximum number of simultaneous connections to a server */
#define STEAM_MAX_CONNECTIONS 16

#include <glib.h>

#include <errno.h>
#include <string.h>
#include <glib/gi18n.h>
#include <sys/types.h>
#ifdef __GNUC__
	#include <unistd.h>
#endif

#ifndef G_GNUC_NULL_TERMINATED
#	if __GNUC__ >= 4
#		define G_GNUC_NULL_TERMINATED __attribute__((__sentinel__))
#	else
#		define G_GNUC_NULL_TERMINATED
#	endif /* __GNUC__ >= 4 */
#endif /* G_GNUC_NULL_TERMINATED */

#ifdef _WIN32
#	include "win32dep.h"
#	define dlopen(a,b) LoadLibrary(a)
#	define RTLD_LAZY
#	define dlsym(a,b) GetProcAddress(a,b)
#	define dlclose(a) FreeLibrary(a)
#else
#	include <arpa/inet.h>
#	include <dlfcn.h>
#	include <netinet/in.h>
#	include <sys/socket.h>
#endif

#include <json-glib/json-glib.h>

#ifndef PURPLE_PLUGINS
#	define PURPLE_PLUGINS
#endif

#include <libpurple/accountopt.h>
#include <libpurple/blist.h>
#include <libpurple/connection.h>
#include <libpurple/debug.h>
#include <libpurple/dnsquery.h>
#include <libpurple/proxy.h>
#include <libpurple/prpl.h>
#include <libpurple/request.h>
#include <libpurple/sslconn.h>
#include <libpurple/version.h>

#if GLIB_MAJOR_VERSION >= 2 && GLIB_MINOR_VERSION >= 12
#	define atoll(a) g_ascii_strtoll(a, NULL, 0)
#endif

#define FB_MAX_MSG_RETRY 2

#define STEAM_PLUGIN_ID "prpl-steam-mobile"
#define STEAM_PLUGIN_VERSION "0.1"

typedef struct _SteamAccount SteamAccount;
typedef struct _SteamBuddy SteamBuddy;

typedef void (*SteamFunc)(SteamAccount *sa);

struct _SteamAccount {
	PurpleAccount *account;
	PurpleConnection *pc;
	GSList *conns; /**< A list of all active SteamConnections */
	GQueue *waiting_conns; /**< A list of all SteamConnections waiting to process */
	GSList *dns_queries;
	GHashTable *cookie_table;
	GHashTable *hostname_ip_cache;
	
	GHashTable *sent_messages_hash;
	guint poll_timeout;
	
	gchar *umqid;
	guint message;
	gchar *steamid;
	gchar *sessionid;
	gint idletime;
};

struct _SteamBuddy {
	SteamAccount *sa;
	PurpleBuddy *buddy;
	
	gchar *steamid;
	gchar *personaname;
	gchar *realname;
	gchar *profileurl;
	guint lastlogoff;
	gchar *avatar;
	
	gchar *gameid;
	gchar *gameextrainfo;
	gchar *gameserversteamid;
	gchar *lobbysteamid;
};


#endif /* LIBSTEAM_H */
