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
    var characters: [Character] = []

    // MARK: - CharactersListPresenterInputProtocol
    func totalCharacters() -> Int {
        return self.interactor.totalResults()
    }
    
    func character(at index: Int) -> CharacterListCellVO {
        return CharacterListCellVO(character: self.characters.count <= index ? nil : characters[index])
    }
    
    func didSelectCharacter(_ character: IndexPath) {
        self.router.presentCharacter(character: self.characters[character.row])
    }
    
    func fetchCharacters() {
        self.interactor.fetchCharacters(resetFetch: false)
    }
    
    func fetchFirstCharacters() {
        self.interactor.fetchCharacters(resetFetch: true)
    }
    
    func getCurrentCount() -> Int {
        return self.characters.count
    }
    

    // MARK: - CharactersListPresenterInteractorOutputProtocol
    func handleSuccessFetchingCharacters(with results: [Character]) {
        self.characters.append(contentsOf: results)
        DispatchQueue.main.async {
            self.view.didFetchCharacters()
        }
    }
    
    func handleFailureFetchingCharacters(with error: String) {
        DispatchQueue.main.async {
            self.view.presentError(message: error)
        }
    }

	// MARK: - Private Methods

}
