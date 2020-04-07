//
//  FriendsTableViewCell.swift
//  vk
//
//  Created by Sergey Tretyakov on 04.04.2020.
//  Copyright © 2020 sergeotretyakov. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var friendProfilePhotoImageView: RoundedImageView!
    
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendSurname: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
