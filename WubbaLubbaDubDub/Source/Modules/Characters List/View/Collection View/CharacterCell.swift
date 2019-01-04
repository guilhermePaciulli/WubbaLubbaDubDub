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
    var activityIndicator: UIActivityIndicatorView?
    
    func configure(withImage imageUrl: URL, andTitle title: String) {
        self.activityIndicator?.removeFromSuperview()
        self.image.kf.indicatorType = .activity
        self.image.kf.setImage(with: imageUrl)
        self.title.text = title
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    func configureToLoad() {
        self.activityIndicator = UIActivityIndicatorView(frame: CGRect.init(origin: CGPoint.zero, size: self.frame.size))
        self.addSubview(self.activityIndicator!)
        self.activityIndicator?.startAnimating()
    }
    
}
