//
//  CharactersListView.swift
//  WubbaLubbaDubDub
//
//  Created Guilherme Paciulli on 04/01/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class CharactersListView: UIViewController, CharactersListPresenterOutputProtocol {

	// MARK: - Viper Module Properties
	var presenter: CharactersListPresenterInputProtocol!
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    internal var reuseIdentifier = "CharacterCell"
    
    // MARK: - Override methods
	override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.prefetchDataSource = self
        self.collectionView.dataSource = self
        
        self.presenter.fetchFirstCharacters()
        self.startLoadingEntireCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.968627451, green: 0.9411764706, blue: 0.4784313725, alpha: 1)
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.968627451, green: 0.9411764706, blue: 0.4784313725, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
    }

    // MARK: - CharactersListPresenterOutputProtocol
    func didFetchCharacters() {
        self.collectionView.reloadData()
        if self.activityIndicator.isAnimating {
            self.stopLoadingEntireCollectionView()
        }
    }
    
    func presentError(message: String) {
        self.presentAlert(withTitle: "Error", andDescription: message)
    }

	// MARK: - Private Methods
    func startLoadingEntireCollectionView() {
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
    }
    
    func stopLoadingEntireCollectionView() {
        self.activityIndicator.isHidden = true
        self.activityIndicator.stopAnimating()
    }

}
