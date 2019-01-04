//
//  CharactersListRouter.swift
//  WubbaLubbaDubDub
//
//  Created Guilherme Paciulli on 04/01/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class CharactersListRouter: NSObject, CharactersListRouterProtocol {

	// MARK: - Constants
	private let storyBoardName = "CharactersList"
	private let viewIdentifier = "CharactersListView"

	// MARK: - Viper Module Properties
	weak var view: CharactersListView!

	// MARK: - Constructors
	override init() {
		super.init()

		let view = self.viewControllerFromStoryboard()
		let interactor = CharactersListInteractor()
		let presenter = CharactersListPresenter()

		presenter.interactor = interactor
		presenter.router = self
		presenter.view = view

		view.presenter = presenter
		interactor.output = presenter

		self.view = view
	}

    // MARK: - CharactersListRouterProtocol
    func presentCharacter(character: Character) {
        fatalError()
    }
    
    func presentAsRoot(window: UIWindow) {
        window.rootViewController = self.view
    }

	// MARK: - Private methods
	private func viewControllerFromStoryboard() -> CharactersListView {
		let storyboard = UIStoryboard(name: self.storyBoardName, bundle: nil)
		let viewController = storyboard.instantiateViewController(withIdentifier: self.viewIdentifier)

		return viewController as! CharactersListView
	}
}
