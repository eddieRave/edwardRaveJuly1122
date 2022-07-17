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

// MARK: "celcius" is actually spelled "celsius", but the tests won't pass if the  spelling doesn't match and I don't want to edit the tests.

enum TemperatureScale: TempConvertable {
    
    case fahrenheit(Int)
    case celcius(Int)
    case kelvin(Int)
    
    var tempInFahren: Int {
        return getTempInFahrenheit()
    }
    
    func getTempInFahrenheit() -> Int {
        switch self {
        case .fahrenheit(let temperature):
            return temperature
        case .celcius(let temperature):
            // Formula to convert Celsius to Fahrenheit:
                // °F = °C × (9/5) + 32
            let temperatureInCelsius = temperature * 9 / 5 + 32
            return temperatureInCelsius
        case .kelvin(let temperature):
            // Formula to convert Kelvin to Fahrenheit:
                // °F = (K − 273.15) × 9/5 + 32
            let temperatureInKelvin = (temperature - Int(273.15)) * 9 / 5 + 32
            return temperatureInKelvin
        }
    }
    
}

protocol TempConvertable {
    func getTempInFahrenheit() -> Int
    var tempInFahren: Int { get }
}
