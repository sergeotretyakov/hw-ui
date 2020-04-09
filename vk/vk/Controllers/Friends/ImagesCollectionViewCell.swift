//
//  ImagesCollectionViewCell.swift
//  vk
//
//  Created by Sergey Tretyakov on 04.04.2020.
//  Copyright © 2020 sergeotretyakov. All rights reserved.
//

import UIKit

class ImagesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var friendPhoto: UIImageView!
    
    @IBOutlet weak var likesButton: LikesButton!
    
    @IBAction func actionLikesButtonTapped(_ sender: LikesButton) {
        sender.updateLikesCount()
    }
    
}
