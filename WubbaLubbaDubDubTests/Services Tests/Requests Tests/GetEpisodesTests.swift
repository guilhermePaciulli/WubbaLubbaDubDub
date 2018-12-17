//
//  GetEpisodesTests.swift
//  WubbaLubbaDubDubTests
//
//  Created by Guilherme Paciulli on 17/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import XCTest

@testable import WubbaLubbaDubDub

class GetEpisodesTests: XCTestCase {
    
    
    func testFetchingEpisodes() {
        
        var episodes: FetchResponse<[WubbaLubbaDubDub.Episode]>!
        
        let expectation = self.expectation(description: "Fetch episodes")
        APIClient.shared.send(GetEpisodes(), completion: { result in
            
            switch result {
            case .success(let charResult):
                episodes = charResult
                break
            case .failure(_):
                break
            }
            
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 15, handler: nil)
        
        XCTAssertNotNil(episodes)
        XCTAssertGreaterThan(episodes.info.count, 0)
        XCTAssertGreaterThan(episodes.results.count, 0)
        
    }
}
