//
//  AllGroupsTableViewController.swift
//  vk
//
//  Created by Sergey Tretyakov on 04.04.2020.
//  Copyright © 2020 sergeotretyakov. All rights reserved.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var groups = [Group(groupName: "Crypto", groupImage: "4.png"),
                  Group(groupName: "Religion", groupImage: "5.png"),
                  Group(groupName: "Egypt", groupImage: "6.png")]
    
    var filteedGroups = [Group]()
    var searching = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.tableFooterView = UIView()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
        return filteedGroups.count
        }
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsTableViewCell", for: indexPath) as! AllGroupsTableViewCell

        var group: Group
        
        if searching {
            group = filteedGroups[indexPath.row]
        } else {
            group = groups[indexPath.row]
        }
        
        cell.allGroupsName.text = group.groupName
        cell.allGroupsImage.image = UIImage(named: group.groupImage)

        return cell
    }
}

extension AllGroupsTableViewController: UISearchBarDelegate {

func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    filteedGroups = groups.filter({ (group: Group) -> Bool in
        return group.groupName.lowercased().contains(searchText.lowercased())
    })
    searching = true
    tableView.reloadData()
    }
}
