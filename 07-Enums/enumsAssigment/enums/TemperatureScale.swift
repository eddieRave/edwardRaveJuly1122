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

protocol TempConvertable {
    func getTempInFahrenheit() -> Int
    var tempInFahren: Int { get }
}

enum TemperatureScale: TempConvertable {

    var tempInFahren: Int {
        return self.getTempInFahrenheit()
    }

    func getTempInFahrenheit() -> Int {
          switch self {
          case .fahrenheit(let fahrenheit):
              return fahrenheit
          case .celcius(let celsius):
              return convertCelcius(cel: celsius)
          case .kelvin(let kelvin):
              return convertCelcius(cel: kelvin - 273)
          }
      }


    func convertCelcius(cel: Int) -> Int {
        return cel * 9 / 5 + 32
    }

    case fahrenheit(Int)
    case celcius(Int)
    case kelvin(Int)
}
