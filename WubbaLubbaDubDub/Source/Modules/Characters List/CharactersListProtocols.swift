//
//  CharactersListProtocols.swift
//  WubbaLubbaDubDub
//
//  Created Guilherme Paciulli on 04/01/19.
//  Copyright © 2019. All rights reserved.
//

import Foundation

// MARK: - Router
protocol CharactersListRouterProtocol: class {
    func presentCharacter(character: Character)
}

// MARK: - Interactor
protocol CharactersListInteractorInputProtocol {
    func fetchCharacters()
}

// MARK: - Presenter
protocol CharactersListPresenterInputProtocol: class {
    func numberOfCharacters() -> Int
    func character(at index: Int) -> Character
    func didSelectCharacter(_ character: Character)
}

protocol CharactersListInteractorOutputProtocol: class {
    func handleSuccessFetchingCharacters(with results: [Character])
    func handleFailureFetchingCharacters(with error: String)
}

// MARK: - View
protocol CharactersListPresenterOutputProtocol: class {
    func didFetchCharacters()
    func presentError(message: String)
}
