//
//  CharacterDetailsRouter.swift
//  WubbaLubbaDubDub
//
//  Created Guilherme Paciulli on 09/01/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class CharacterDetailsRouter: NSObject, CharacterDetailsRouterProtocol {

	// MARK: - Constants
	private let storyBoardName = "CharacterDetails"
	private let viewIdentifier = "CharacterDetailsView"

	// MARK: - Viper Module Properties
	weak var view: CharacterDetailsView!

	// MARK: - Constructors
	override init() {
		super.init()

		let view = self.viewControllerFromStoryboard()
		let interactor = CharacterDetailsInteractor()
		let presenter = CharacterDetailsPresenter()

		presenter.interactor = interactor
		presenter.router = self
		presenter.view = view

		view.presenter = presenter
		interactor.output = presenter

		self.view = view
	}

    // MARK: - CharacterDetailsRouterProtocol

	// MARK: - Private methods
	private func viewControllerFromStoryboard() -> CharacterDetailsView {
		let storyboard = UIStoryboard(name: self.storyBoardName, bundle: nil)
		let viewController = storyboard.instantiateViewController(withIdentifier: self.viewIdentifier)

		return viewController as! CharacterDetailsView
	}
}
