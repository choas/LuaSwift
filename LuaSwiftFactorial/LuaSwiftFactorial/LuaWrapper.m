//
//  LuaWrapper.m
//  LuaSwiftFactorial
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
    int result = luaL_loadstring(luaState, script);
    if ( result != LUA_OK ) {
        print_error(luaState);
        return;
    }
    
    result = lua_pcall(luaState, 0, 0, 0);
    if ( result != LUA_OK ) {
        print_error(luaState);
        return;
    }
}

- (void) destruct {
    lua_close(luaState);
}


// see also https://github.com/cslarsen/lua-cpp/blob/master/runlua.cpp
void print_error(lua_State* state) {
    // The error message is on top of the stack. Fetch it, print it and then pop
    // it off the stack.
    const char* message = lua_tostring(state, -1);
    puts(message);
    lua_pop(state, 1);
}

- (LUA_NUMBER) call: (lua_State *) state
            methode:  (const char *) methode
              value: (LUA_NUMBER) value {
    
    lua_State * luaStateEx = luaState;
    
    if (state != Nil) {
        luaStateEx = state;
    }
    
    lua_getglobal(luaStateEx, methode);
    lua_pushnumber(luaStateEx, value);
    LUA_NUMBER result = lua_pcall(luaStateEx, 1, 1, 0);
    if (result != LUA_OK)  {
        puts("error");
        print_error(luaStateEx);
        return result;
    }
    
    result = lua_tonumber(luaStateEx, -1);
    lua_pop(luaStateEx, 1);
    return result;
}

@end
