//
//  TemperatureScale.swift
//  enums
//
//  Created by Luat on 8/10/21.
//

import Foundation

/**
 1) Have Temperature Enum Adopt the TempConvertable protocol
 2) Implement getTempInFarnheit func
 3) Implement tempInFahren property
 */

enum TemperatureScale: TempConvertable {
    case fahrenheit(Int)
    case celcius(Int)
    case kelvin(Int)
    
    func getTempInFahrenheit() -> Int {
        
        switch self {
        case .fahrenheit(_):
            return 0
        case .celcius(let int):
            return int * 9/5 + 32
        case .kelvin(let int):
            return (int - 273) * 9/5 + 32
        }
    }
    
    var tempInFahren: Int {
        getTempInFahrenheit()
    }
}

protocol TempConvertable {
    func getTempInFahrenheit() -> Int
    var tempInFahren: Int { get }
}


