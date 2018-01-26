//
//  Converter.swift
//  iOsFri26Converter
//
//  Created by David Svensson on 2018-01-26.
//  Copyright © 2018 David Svensson. All rights reserved.
//

import Foundation

class Converter {
    
    func degreesFahrenheit(degreesCelsius: Int ) -> Int {
        return Int(1.8 * Float(degreesCelsius) + 32.0)
    }
    
}
