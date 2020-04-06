//
//  FriendsTableViewController.swift
//  vk
//
//  Created by Sergey Tretyakov on 04.04.2020.
//  Copyright © 2020 sergeotretyakov. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    var friends = [User(name: "Nina", surname: "Slisarenko", photo: "1.png"),
                   User(name: "Andrew", surname: "Shulyndin", photo: "2.png"),
                   User(name: "Alex", surname: "Makarenko", photo: "3.png")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCell", for: indexPath) as! FriendsTableViewCell

        cell.friendName.text = friends[indexPath.row].name
        cell.friendSurname.text = friends[indexPath.row].surname
        cell.friendImage.image = UIImage(named: friends[indexPath.row].photo)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueShowPhotos" {
            guard let viewController = segue.destination as? ImagesCollectionViewController,
                let selectedIndexPath = tableView.indexPathForSelectedRow else {
                return
            }
            let user = friends[selectedIndexPath.row]
            viewController.user = user
        }
    }
    
}
