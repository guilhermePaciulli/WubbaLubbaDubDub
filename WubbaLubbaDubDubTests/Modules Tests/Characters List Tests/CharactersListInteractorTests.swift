//
//  CharactersListInteractorTests.swift
//  WubbaLubbaDubDubTests
//
//  Created by Guilherme Paciulli on 07/01/19.
//  Copyright © 2019 Guilherme Paciulli. All rights reserved.
//

import XCTest

@testable import WubbaLubbaDubDub

class CharactersListInteractorTests: XCTestCase, CharactersListInteractorOutputProtocol {
    
    var interactor: CharactersListInteractor!
    
    var fetchExpectation: XCTestExpectation!

    override func setUp() {
        super.setUp()
        
        self.interactor = CharactersListInteractor()
        self.interactor.output = self
        self.fetchExpectation = self.expectation(description: "Fetching...")
    }
    
    override func tearDown() {
        super.tearDown()
        
        self.interactor = nil
        self.fetchExpectation = nil
    }
    
    func testFetchCharactersPagination() {
        // Fetching first page
        self.interactor.fetchCharacters(resetFetch: true)
        waitForExpectations(timeout: 15, handler: nil)
        // Fetching seconde page
        self.interactor.fetchCharacters(resetFetch: false)
        XCTAssertEqual(self.interactor.pageCount, 2)
    }
    
    func testPreventTwoRequests() {
        self.interactor.fetchCharacters(resetFetch: true)
        self.interactor.fetchCharacters(resetFetch: false)
        XCTAssertEqual(self.interactor.pageCount, 1)
        XCTAssertTrue(self.interactor.isFetchCharactersInProgress)
        waitForExpectations(timeout: 15, handler: nil)
    }
    
    func testResetFetch() {
        self.interactor.fetchCharacters(resetFetch: true)
        waitForExpectations(timeout: 15, handler: nil)
        self.interactor.fetchCharacters(resetFetch: true)
        XCTAssertEqual(self.interactor.pageCount, 1)
    }
    
    func handleSuccessFetchingCharacters(with results: [WubbaLubbaDubDub.Character]) {
        self.fetchExpectation.fulfill()
    }
    
    func handleFailureFetchingCharacters(with error: String) {
        self.fetchExpectation.fulfill()
    }

}
