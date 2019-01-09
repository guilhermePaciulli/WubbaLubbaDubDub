//
//  CharactersListView+Delegate.swift
//  WubbaLubbaDubDub
//
//  Created by Guilherme Paciulli on 09/01/19.
//  Copyright © 2019 Guilherme Paciulli. All rights reserved.
//

import Foundation
import UIKit

extension CharactersListView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter.didSelectCharacter(indexPath)
    }
    
}
