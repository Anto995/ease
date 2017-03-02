//
//  RoomCollectionViewCell.swift
//  Ease
//
//  Created by Antonio Scialdone on 01/03/2017.
//  Copyright © 2017 Antonio Scialdone. All rights reserved.
//

import UIKit

class RoomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func updateWithImage(image: UIImage?) {
        if let imageToDisplay = image {
            imageView.image = imageToDisplay
        } else {
            imageView.image = nil
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateWithImage(image: nil)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        updateWithImage(image: nil)
    }
}
