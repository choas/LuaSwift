//
//  Factorial.swift
//  LuaSwiftFactorialV0
//
//  Created by Gregori, Lars on 24.12.19.
//  Copyright © 2019 Gregori, Lars. All rights reserved.
//

import Foundation


@objc(Factorial)
class Factorial : NSObject {
    
    var lua : Lua
    let ptrFname = strdup("factorial")
    
    @objc
    init(script: String) {
        print("*********************** INIT")
        
        lua = Lua()
        lua.setup()
        
        let ptrScript = strdup(script)
        lua.script(ptrScript)
        free(ptrScript)
        
        let funcName = strdup("factorialExternal")
        lua.register(factorialExternal, withName: funcName)
        free(funcName)
    }
    
    @objc
    func callFactorial(state: OpaquePointer? = nil,
                       value: lua_Number) -> lua_Number {
        if value > 170 {
            return Double.infinity
        }
        return lua.call(state,
                        methode: ptrFname,
                        value: value)
    }
    
    deinit {
        free(ptrFname)
        lua.destruct()
    }
}
