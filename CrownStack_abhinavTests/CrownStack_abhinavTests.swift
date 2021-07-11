//
//  CrownStack_abhinavTests.swift
//  CrownStack_abhinavTests
//
//  Created by Abhinav.prashar on 06/07/21.
//

import XCTest
@testable import CrownStack_abhinav

class HttpUtilityIntegrationTest: XCTestCase {

    func test_HitApi_WithInvalidUrl_Returns_Error(){
        // ARRANGE
        let handler = HttpUtility()
        let loginExpectations = expectation(description: "test_HitApi_WithInvalidUrl_Returns_Error")

        // ACT
        handler.getApiData(requestUrl: URL(string: "https://official-joke-api.appspot.com/random_joke")!, resultType: SongsModel.self) { data in
            XCTAssertNil(data)
            loginExpectations.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    
    func test_HitApi_WithRightUrl_Returns_Error(){
        // ARRANGE
        let handler = HttpUtility()
        let loginExpectations = expectation(description: "WithValidRequest_Returns_LoginData")

        // ACT
        handler.getApiData(requestUrl: URL(string: ApiEndpoints.songUrl)!, resultType: SongsModel.self) { data in
            XCTAssertNotNil(data)
            loginExpectations.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    
    func test_HitApi_WithNilUrl_Returns_Error(){
        // ARRANGE
        let handler = HttpUtility()
        let loginExpectations = expectation(description: "WithValidRequest_Returns_LoginData")

        // ACT
        handler.getApiData(requestUrl: URL(string: "https://github.com/ABWillJOHN/CrownStack_abhinav")!, resultType: SongsModel.self) { data in
            XCTAssertNil(data)
            loginExpectations.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
}
