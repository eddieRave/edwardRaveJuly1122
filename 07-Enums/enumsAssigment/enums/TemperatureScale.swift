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

func convertCToF(_ c: Int) -> Int {
    return (c * 9 / 5) + 32
}

func convertKToF(_ k: Int) -> Int {
    return convertCToF(k-273)
}

enum TemperatureScale: TempConvertable {
    func getTempInFahrenheit() -> Int {
        switch self {
            
        case .fahrenheit(let f):
            return f
        case .celcius(let c):
            return convertCToF(c)
        case .kelvin(let k):
            return convertKToF(k)
        }
    }
    
    var tempInFahren: Int {
        return getTempInFahrenheit()
    }
    
    case fahrenheit(Int)
    case celcius(Int)
    case kelvin(Int)
}

protocol TempConvertable {
    func getTempInFahrenheit() -> Int
    var tempInFahren: Int { get }
}



