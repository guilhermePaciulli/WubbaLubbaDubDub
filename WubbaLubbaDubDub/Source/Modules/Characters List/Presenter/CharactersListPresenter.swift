//
//  CharactersListPresenter.swift
//  WubbaLubbaDubDub
//
//  Created Guilherme Paciulli on 04/01/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class CharactersListPresenter: NSObject, CharactersListPresenterInputProtocol, CharactersListInteractorOutputProtocol {

	// MARK: - Viper Module Properties
    weak var view: CharactersListPresenterOutputProtocol!
    var interactor: CharactersListInteractorInputProtocol!
    var router: CharactersListRouterProtocol!
    
    // MARK: - Properties
    var currentCount = 0
    var characters: [Character] = []

    // MARK: - CharactersListPresenterInputProtocol
    func totalCharacters() -> Int {
        return self.interactor.totalResults()
    }
    
    func character(at index: Int) -> Character? {
        if self.characters.count <= index {
            return nil
        }
        return characters[index]
    }
    
    func didSelectCharacter(_ character: IndexPath) {
        self.router.presentCharacter(character: self.characters[character.row])
    }
    
    func fetchCharacters(at indexPaths: [IndexPath]) {
        self.interactor.fetchCharacters(withIndexes: indexPaths)
    }
    
    func fetchFirstCharacters() {
        self.interactor.fetchCharacters(withIndexes: nil)
    }
    
    func getCurrentCount() -> Int {
        return self.characters.count
    }
    

    // MARK: - CharactersListPresenterInteractorOutputProtocol
    func handleSuccessFetchingCharacters(with results: [Character], andIndexes indexes: [IndexPath]?) {
        self.characters.append(contentsOf: results)
        self.currentCount += results.count
        self.view.didFetchCharacters(atIndexes: indexes)
    }
    
    func handleFailureFetchingCharacters(with error: String) {
        self.view.presentError(message: error)
    }

	// MARK: - Private Methods

}
