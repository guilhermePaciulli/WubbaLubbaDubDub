//
//  GetLocationsTests.swift
//  WubbaLubbaDubDubTests
//
//  Created by Guilherme Paciulli on 17/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import XCTest

@testable import WubbaLubbaDubDub

class GetLocationsTests: XCTestCase {

    func testFetchingLocations() {
        var locations: FetchResponse<[WubbaLubbaDubDub.Location]>!
        
        let expectation = self.expectation(description: "Fetch locations")
        APIClient.shared.send(GetLocations(), completion: { result in
            
            switch result {
            case .success(let locResult):
                locations = locResult
                break
            case .failure(_):
                break
            }
            
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 15, handler: nil)
        
        XCTAssertNotNil(locations)
        XCTAssertGreaterThan(locations.info.count, 0)
        XCTAssertGreaterThan(locations.results.count, 0)
    }
}
