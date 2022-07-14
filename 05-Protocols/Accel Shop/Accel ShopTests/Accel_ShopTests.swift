//
//  Accel_ShopTests.swift
//  Accel ShopTests
//
//  Created by Joel Maldonado on 7/14/22.
//

import XCTest
@testable import Accel_Shop

class Accel_ShopTests: XCTestCase {
    func testMyShop() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        print()
        print()
        let shop = Shop()
        let acceleration = Inspection(type: .Acceleration)
        let brake = Inspection(type: .Braking)
        let vehicle = Vehicle(make: "Ford", model: "Expedition", id: "100", inspections: acceleration)
        let vehicle2 = Vehicle(make: "Toyota", model: "Camry", id: "200", inspections: brake)
        let vehicle3 = Vehicle(make: "Honda", model: "Civic", id: "300", inspections: acceleration, brake)
        shop.add(vehicle: vehicle)
        shop.add(vehicle: vehicle2)
        shop.add(vehicle: vehicle3)
        shop.completeWork()
        
        print()
    }
}
