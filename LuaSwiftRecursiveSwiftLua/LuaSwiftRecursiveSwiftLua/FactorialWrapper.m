//
//  FactorialWrapper.m
//  LuaSwiftRecursiveSwiftLua
//
//  Created by Gregori, Lars on 09.02.20.
//  Copyright © 2020 Gregori, Lars. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FactorialWrapper.h"
#import "LuaSwiftRecursiveSwiftLua-Swift.h"

Factorial * factorial;

int factorialExternal(lua_State *luaState) {
    if (factorial == Nil) {
        factorial = [[Factorial alloc] initWithScript: @""];
    }
    
    UInt64 n = lua_tointeger(luaState, -1L);
    lua_pop(luaState, 1);
    
    lua_Number res = [factorial
                      callFactorialWithState:luaState
                      value:n];
    lua_pushnumber(luaState, res);
    
    return 1;
}
