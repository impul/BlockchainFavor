//
//  ImageCell.swift
//  Example
//
//  Created by Pavlo Boiko on 16.05.18.
//  Copyright © 2018 Pavlo Boiko. All rights reserved.
//

import UIKit

class ImageCell:UICollectionViewCell{
    
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
}
