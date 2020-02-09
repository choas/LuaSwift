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
            let luaScript = try String(contentsOfFile: filename)
            
            let fac = Factorial(script: luaScript)
            let result = fac.callFactorial(value: lua_Number(6))
            print(result)
        } catch let error {
            print("can not read file", filename, error)
        }
    }
}
