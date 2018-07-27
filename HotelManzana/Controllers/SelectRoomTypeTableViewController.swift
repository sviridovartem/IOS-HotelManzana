//
//  SelectRoomTypeTableViewController.swift
//  HotelManzana
//
//  Created by Artem Sviridov on 27.07.2018.
//  Copyright © 2018 Artem Sviridov. All rights reserved.
//

import UIKit

protocol SelectRoomTypeTableViewControllerDelegate {
    func didSelect(roomType: RoomType)
}


class SelectRoomTypeTableViewController: UITableViewController {
    
    var roomType: RoomType?
    var delegate: SelectRoomTypeTableViewControllerDelegate?


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

   

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView,
                              numberOfRowsInSection section: Int) -> Int {
    
        return RoomType.all.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTypeCell", for: indexPath)
        let roomType = RoomType.all[indexPath.row]
        
        cell.textLabel?.text = roomType.name
//        cell.backgroundColor = .white
        cell.detailTextLabel?.text = "$ \(roomType.price)"
        
        if roomType == self.roomType {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        roomType = RoomType.all[indexPath.row]
        delegate?.didSelect(roomType: roomType!)
        tableView.reloadData()
    }
    
    

  
}
