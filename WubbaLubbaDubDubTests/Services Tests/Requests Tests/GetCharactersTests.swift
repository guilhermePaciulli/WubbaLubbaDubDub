//
//  GetCharactersTests.swift
//  WubbaLubbaDubDubTests
//
//  Created by Guilherme Paciulli on 11/12/18.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import XCTest

@testable import WubbaLubbaDubDub

class GetCharactersTests: XCTestCase {


    func testFetchingCharacters() {
        
        var characters: FetchResponse<[WubbaLubbaDubDub.Character]>!
        
        let expectation = self.expectation(description: "Fetch characters")
        APIClient.shared.send(GetCharacters(), completion: { result in
            
            switch result {
            case .success(let charResult):
                characters = charResult
                break
            case .failure(_):
                break
            }
            
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 60, handler: nil)
        
        XCTAssertNotNil(characters)
        XCTAssertGreaterThan(characters.info.count, 0)
        XCTAssertGreaterThan(characters.results.count, 0)
        
    }
    
    func testFilteringCharacters() {
        
        var characters: FetchResponse<[WubbaLubbaDubDub.Character]>!
        
        let expectation = self.expectation(description: "Filter characters")
        APIClient.shared.send(GetCharacters(withName: "Rick", status: .alive, andGender: .male), completion: { result in
            
            switch result {
            case .success(let charResult):
                characters = charResult
                break
            case .failure(_):
                break
            }
            
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 60, handler: nil)
        
        XCTAssertNotNil(characters)
        XCTAssertGreaterThan(characters.info.count, 0)
        XCTAssertGreaterThan(characters.results.count, 0)
        XCTAssertTrue(characters.results.first!.name.contains("Rick"))
        
    }
    
    func testFetchCharactersByID() {
        
        var characters: [WubbaLubbaDubDub.Character] = []
        
        let expectation = self.expectation(description: "Fetch characters by ID")
        APIClient.shared.send(SelectCharacter(withIDs: [1, 2]), completion: { result in
            
            switch result {
            case .success(let charResult):
                characters = charResult
                break
            case .failure(_):
                break
            }
            
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 60, handler: nil)
        
        XCTAssertNotNil(characters)
        XCTAssertEqual(characters.count, 2)
        XCTAssertEqual(characters.first!.name, "Rick Sanchez")
        
    }
}
