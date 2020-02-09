//
//  ViewController.swift
//  LuaSwiftFactorial
//
//  Created by Gregori, Lars on 09.02.20.
//  Copyright © 2020 Gregori, Lars. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filename = Bundle.main.path(forResource: "script",
                                        ofType: "lua")!
        do {
            
            let lua = Lua()
            lua.setup()
            
            let luaScript = try String(contentsOfFile: filename)
            let ptrScript = strdup(luaScript)
            lua.script(ptrScript)
            free(ptrScript)
            
            // call Lua factorial
            let ptrFname = strdup("factorial")
            let value = lua_Number(100)
            let result = lua.call(nil, methode: ptrFname, value: value)
            free(ptrFname)
            print(result)
            
            lua.destruct()
        } catch let error {
            print("can not read file", filename, error)
        }
    }
}
