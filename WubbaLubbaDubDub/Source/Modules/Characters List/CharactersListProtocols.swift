//
//  CharactersListProtocols.swift
//  WubbaLubbaDubDub
//
//  Created Guilherme Paciulli on 04/01/19.
//  Copyright © 2019. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Router
protocol CharactersListRouterProtocol: class {
    func presentCharacter(character: Character)
    func presentAsRoot(window: UIWindow)
}

// MARK: - Interactor
protocol CharactersListInteractorInputProtocol {
    func fetchCharacters(withIndexes indexPaths: [IndexPath]?)
    func totalResults() -> Int
    func hasMorePages() -> Bool
}

// MARK: - Presenter
protocol CharactersListPresenterInputProtocol: class {
    func totalCharacters() -> Int
    func character(at index: Int) -> Character?
    func didSelectCharacter(_ character: IndexPath)

    func fetchCharacters(at indexPaths: [IndexPath])
    func fetchFirstCharacters()
    func getCurrentCount() -> Int
}

protocol CharactersListInteractorOutputProtocol: class {
    func handleSuccessFetchingCharacters(with results: [Character], andIndexes indexes: [IndexPath]?)
    func handleFailureFetchingCharacters(with error: String)
}

// MARK: - View
protocol CharactersListPresenterOutputProtocol: class {
    func didFetchCharacters(atIndexes indexes: [IndexPath]?)
    func presentError(message: String)
}
