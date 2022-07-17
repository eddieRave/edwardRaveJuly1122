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
    
    var tempInFahren: Int {
        
        return self.getTempInFahrenheit()
    }
    
    func getTempInFahrenheit() -> Int {
          switch self {
              
          case .fahrenheit(let fahrenheit):
              return fahrenheit
          case .celcius(let celsius):
              return convertCelcius(celc: celsius)
          case .kelvin(let kelvin):
              return convertCelcius(celc: kelvin - 273)
          }
      }

    
    func convertCelcius(celc: Int) -> Int {
        
        let result = celc * 9 / 5 + 32
        
        return result
    }
    
    case fahrenheit(Int)
    case celcius(Int)
    case kelvin(Int)
}

protocol TempConvertable {
    func getTempInFahrenheit() -> Int
    var tempInFahren: Int { get }
}
