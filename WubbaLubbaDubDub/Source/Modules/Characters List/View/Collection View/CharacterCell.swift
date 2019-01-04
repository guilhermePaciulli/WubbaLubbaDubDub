//
//  CharacterCell.swift
//  WubbaLubbaDubDub
//
//  Created by Guilherme Paciulli on 04/01/19.
//  Copyright © 2019 Guilherme Paciulli. All rights reserved.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    func set(with image: UIImage, and title: String) {
        self.image.image = image
        self.title.text = title
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}
