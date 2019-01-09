//
//  CharacterDetailsPresenter.swift
//  WubbaLubbaDubDub
//
//  Created Guilherme Paciulli on 09/01/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class CharacterDetailsPresenter: NSObject, CharacterDetailsPresenterInputProtocol, CharacterDetailsInteractorOutputProtocol {

	// MARK: - Viper Module Properties
    weak var view: CharacterDetailsPresenterOutputProtocol!
    var interactor: CharacterDetailsInteractorInputProtocol!
    var router: CharacterDetailsRouterProtocol!

    // MARK: - CharacterDetailsPresenterInputProtocol

    // MARK: - CharacterDetailsPresenterInteractorOutputProtocol

	// MARK: - Private Methods

}
