//
//  LuaWrapper.h
//  LuaSwiftHelloWorld
//
//  Created by Gregori, Lars on 09.02.20.
//  Copyright © 2020 Gregori, Lars. All rights reserved.
//

#ifndef LuaWrapper_h
#define LuaWrapper_h

#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

#import <Foundation/Foundation.h>

@interface Lua : NSObject {
    lua_State * luaState;
}

- (void) setup;
- (void) script: (const char *) script;
- (void) destruct;

- (LUA_NUMBER) call: (lua_State *) state
            methode: (const char *) methode
              value: (LUA_NUMBER) value;

@end

#endif /* LuaWrapper_h */
