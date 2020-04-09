//
//  GroupsTableViewCell.swift
//  vk
//
//  Created by Sergey Tretyakov on 04.04.2020.
//  Copyright © 2020 sergeotretyakov. All rights reserved.
//

import UIKit

class GroupsTableViewCell: UITableViewCell {
    

    @IBOutlet weak var groupImage: RoundedImageView!
    
    @IBOutlet weak var groupName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
