//
//  NetworkServiceTests.swift
//  NetworkServiceTests
//
//  Created by Rave Bizz on 4/28/22.
//

@testable import apiCalls
import XCTest

class NetworkServiceTests: XCTestCase {

    let sut = NetworkService()
    
    func testFetchJoke() {
        let expectation = expectation(description: "fetching data")
        var resultData: Joke?
        sut.fetchJoke { data in
            resultData = data
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
        XCTAssertNotNil(resultData)
        
    }
    
    func testFetchDrink() {
        let expectation = expectation(description: "fetching data")
        var resultData: Drink?
        sut.fetchDrink { data in
            resultData = data
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
        XCTAssertNotNil(resultData)
        
    }
    
    func testFetchEpisode() {
        let expectation = expectation(description: "fetching data")
        var resultData: Episode?
        sut.fetchEpisode { data in
            resultData = data
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
        XCTAssertNotNil(resultData)
        
    }
    
    func testFetchMusic() {
        let expectation = expectation(description: "fetching data")
        var resultData: Music?
        sut.fetchMusic { data in
            resultData = data
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
        XCTAssertNotNil(resultData)
        
    }
}
