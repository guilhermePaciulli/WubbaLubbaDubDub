//
//  CharacterCell.swift
//  WubbaLubbaDubDub
//
//  Created by Guilherme Paciulli on 04/01/19.
//  Copyright © 2019 Guilherme Paciulli. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    func configure(withCharacter character: CharacterListCellVO) {
        if character.isFetching {
            self.configureToLoad()
        } else {
            self.configure(withTitle: character.title!, andImage: character.image!)
        }
    }
    
    private func configure(withTitle title: String, andImage imageUrl: URL) {
        self.image.isHidden = false
        self.title.isHidden = false
        
        self.image.kf.indicatorType = .activity
        self.image.kf.setImage(with: imageUrl)
        self.title.text = title
    }
    
    private func configureToLoad() {
        self.image.isHidden = true
        self.title.isHidden = true
        self.activityIndicator?.isHidden = false
        
        self.activityIndicator?.startAnimating()
    }
    
}
