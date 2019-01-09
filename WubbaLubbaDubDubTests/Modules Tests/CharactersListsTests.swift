//
//  CharactersListsTests.swift
//  WubbaLubbaDubDubTests
//
//  Created by Guilherme Paciulli on 07/01/19.
//  Copyright © 2019 Guilherme Paciulli. All rights reserved.
//

import XCTest

@testable import WubbaLubbaDubDub

class CharactersListsTests: XCTestCase {
    
    var router: CharactersListRouter!
    var presenter: CharactersListPresenter!
    var interactor: CharactersListInteractor!
    var view: CharactersListView!

    override func setUp() {
        super.setUp()
        
        self.router = CharactersListRouter()
        
    }

    
    override func tearDown() {
        super.tearDown()
    }

    func testExample() {
    }
    
}
