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
    
    // MARK: - Properties
    private var reuseIdentifier = "characterCell"
    
    // MARK: - Override methods
	override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.prefetchDataSource = self
        self.collectionView.dataSource = self
    }

    // MARK: - CharactersListPresenterOutputProtocol
    func didFetchCharacters() {
    }
    
    func presentError(message: String) {
    }

	// MARK: - Private Methods

}

extension CharactersListView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter.didSelectCharacter(indexPath)
    }
    
}

extension CharactersListView: UICollectionViewDataSourcePrefetching {
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
    }
    
}

extension CharactersListView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.numberOfCharacters()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let characterCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as? CharacterCell else {
            return UICollectionViewCell()
        }
        let character = self.presenter.character(at: indexPath.row)
        characterCell.set(with: character.image, and: character.name)
        
        return characterCell
    }
}
