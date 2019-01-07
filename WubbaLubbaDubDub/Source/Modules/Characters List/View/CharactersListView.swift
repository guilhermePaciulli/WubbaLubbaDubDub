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
    private var reuseIdentifier = "CharacterCell"
    
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
    func didFetchCharacters(atIndexes indexes: [IndexPath]?) {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            if self.activityIndicator.isAnimating {
                self.stopLoadingEntireCollectionView()
            }
        }
    }
    
    func presentError(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                alert.dismiss(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        }
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

extension CharactersListView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter.didSelectCharacter(indexPath)
    }
    
}

extension CharactersListView: UICollectionViewDataSourcePrefetching {
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        let validate = indexPaths.contains(where: { iPath in
            return iPath.row > self.presenter.getCurrentCount()
        })
        if validate {
            self.presenter.fetchCharacters(at: indexPaths)
        }
    }
    
}

extension CharactersListView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.totalCharacters()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let characterCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as? CharacterCell else {
            return UICollectionViewCell()
        }
        if let character = self.presenter.character(at: indexPath.row) {
            characterCell.configure(withImage: character.image, andTitle: character.name)
        } else {
            characterCell.configureToLoad()
        }
        
        return characterCell
    }
}
