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
    func getTempInFahrenheit() -> Int {
        switch self {
        case .fahrenheit(let temp):
            return temp
        case .celcius(let temp):
            return Int(32.0 + Float(9.0 / 5.0 * Float(temp)) )
        case .kelvin(let temp):
            return (temp - 273) * 9/5 + 32
        }
    }
    
    var tempInFahren: Int {
        return self.getTempInFahrenheit()
    }
    
    case fahrenheit(Int)
    case celcius(Int)
    case kelvin(Int)
    // implementation of property
}

protocol TempConvertable {
    func getTempInFahrenheit() -> Int
    var tempInFahren: Int { get }
}

//enum TemperatureScale : TempConvertable {
//    var tempInFahren: Int {
//        get {
//            switch self {
//            case .celcius:
//                return 1
//            case .kelvin:
//                return 2
//            case .fahrenheit:
//                return -1
//            }
//
//        }
//    }
//    func getTempInFahrenheit()->Int {
//        return 212
//    }
//
//
//}


