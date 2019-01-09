//
//  CharactersListTests.swift
//  WubbaLubbaDubDubTests
//
//  Created by Guilherme Paciulli on 07/01/19.
//  Copyright © 2019 Guilherme Paciulli. All rights reserved.
//

import XCTest

@testable import WubbaLubbaDubDub

class CharactersListTests: XCTestCase {

    var characterListRouter: CharactersListRouter!
    
    override func setUp() {
        self.characterListRouter = CharactersListRouter()
    }

    override func tearDown() {
        self.characterListRouter = nil
    }

    func testBecomingRoot() {
        self.characterListRouter.presentAsRoot(window: UIApplication.shared.keyWindow!)
        XCTAssertTrue(self.characterListRouter.view.isFirstResponder)
    }
    
    func testFetchingFirstPageCharacter() {
        self.characterListRouter.presentAsRoot(window: UIApplication.shared.keyWindow!)
//        self.characterListRouter.
    }

}
