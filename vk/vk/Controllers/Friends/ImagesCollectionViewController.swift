//
//  ImagesCollectionViewController.swift
//  vk
//
//  Created by Sergey Tretyakov on 04.04.2020.
//  Copyright © 2020 sergeotretyakov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ImagesCollectionViewCell"

class ImagesCollectionViewController: UICollectionViewController {
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImagesCollectionViewCell
        
        guard let photo = user?.photo else {
            return UICollectionViewCell()
        }
        cell.friendPhoto.image = UIImage(named: photo)
        
        return cell
    }
}

