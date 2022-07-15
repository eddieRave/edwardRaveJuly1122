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

enum TemperatureScale: TempConvertable  {
    func getTempInFahrenheit() -> Int {
        switch self {
            
        case .fahrenheit(let fahrenheit):
            return fahrenheit
        case .celcius(let celsius):
            return celsiusToFahrenheit(celsius)
        case .kelvin(let kelvin):
            return celsiusToFahrenheit(kelvin - 273)
        }
    }
 
    
    var tempInFahren: Int {
        return self.getTempInFahrenheit()
    }
    
    func celsiusToFahrenheit(_ temp: Int) -> Int {
        temp * 9 / 5 + 32
    }
    
    case fahrenheit(Int)
    case celcius(Int)
    case kelvin(Int)
}

protocol TempConvertable {
    func getTempInFahrenheit() -> Int
    var tempInFahren: Int { get }
}
