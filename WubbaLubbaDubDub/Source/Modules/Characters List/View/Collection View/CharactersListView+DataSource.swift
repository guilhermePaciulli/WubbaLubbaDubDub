//
//  CharactersListView+DataSource.swift
//  WubbaLubbaDubDub
//
//  Created by Guilherme Paciulli on 09/01/19.
//  Copyright © 2019 Guilherme Paciulli. All rights reserved.
//

import Foundation
import UIKit

extension CharactersListView: UICollectionViewDataSourcePrefetching {
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        let validate = indexPaths.contains(where: { iPath in
            return iPath.row > self.presenter.getCurrentCount()
        })
        if validate {
            self.presenter.fetchCharacters()
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
        characterCell.configure(withCharacter: self.presenter.character(at: indexPath.row))
        return characterCell
    }
}
