//
//  CharactersListInteractor.swift
//  WubbaLubbaDubDub
//
//  Created Guilherme Paciulli on 04/01/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class CharactersListInteractor: NSObject, CharactersListInteractorInputProtocol {

	// MARK: - Viper Module Properties
    weak var output: CharactersListInteractorOutputProtocol!
    
    // MARK: - Properties
    var results: GetCharacters.Response?
    var pageCount = 0
    var isFetchCharactersInProgress = false

	// MARK: - CharactersListInteractorInputProtocol
    func fetchCharacters(resetFetch reset: Bool) {
        if isFetchCharactersInProgress {
            return
        }
        self.isFetchCharactersInProgress = true
        
        if reset {
            self.pageCount = 0
        }
        
        self.pageCount += 1
        APIClient.shared.send(GetCharacters(atPage: self.pageCount), completion: { results in
            switch results {
            case .success(let charResults):
                self.results = charResults
                self.output.handleSuccessFetchingCharacters(with: charResults.results)
            case .failure(let error):
                self.output.handleFailureFetchingCharacters(with: error.message)
            }
            self.isFetchCharactersInProgress = false
        })
    }
    
    func totalResults() -> Int {
        return self.results?.info.count ?? 0
    }

    // MARK: - Private Methods

}
