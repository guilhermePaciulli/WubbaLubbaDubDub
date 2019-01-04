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

    // MARK: - CharactersListPresenterInputProtocol

    // MARK: - CharactersListPresenterInteractorOutputProtocol

	// MARK: - Private Methods

}
