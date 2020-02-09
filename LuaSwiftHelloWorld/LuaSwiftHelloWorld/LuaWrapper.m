//
//  LuaWrapper.m
//  LuaSwiftHelloWorld
//
//  Created by Gregori, Lars on 09.02.20.
//  Copyright © 2020 Gregori, Lars. All rights reserved.
//

#import <Foundation/Foundation.h>

#include "LuaWrapper.h"

LUAMOD_API int luaopen_os (lua_State *L) {
    return 1;
}

@implementation Lua

- (void) setup {
    luaState = luaL_newstate();
    luaL_openlibs(luaState);
}

- (void) script: (const char *) script {
    luaL_loadstring(luaState, script);
    lua_pcall(luaState, 0, 0, 0);
}

- (void) destruct {
    lua_close(luaState);
}

@end
