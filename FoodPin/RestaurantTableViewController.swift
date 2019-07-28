//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Levy Pan on 7/14/19.
//  Copyright © 2019 LVP. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    

    override var prefersStatusBarHidden: Bool {
        // to show the statusbar or not
        return false
    }
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore","Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "NewYork", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurnatTableViewCell
        // Configure the cell...
    cell.nameLabel.text = restaurantNames[indexPath.row]
    cell.locationLabel.text = "in " + restaurantLocations[indexPath.row]
    cell.typeLabel.text = restaurantTypes[indexPath.row]
    cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        /*upgrade the accessory view*/
        if restaurantIsVisited[indexPath.row] {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 建立一个类似动作清单选择列表
        // There are two ways to display the Menu: ActionSheet and Altert
        // .actionSheet = UIAlertControllerStyle.actionSheet
        let optionMenu  = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet /*.altert*/)

        // 加入到动作选单中
        let cancleAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil )
        // Use addAction to add the cancleAction to the Menu
        optionMenu.addAction(cancleAction)
        
        // ***an examole of Closure***
        // Add Call Acion
        let callActionHanlder = { /*Parameters and return type of the closure*/ (action:UIAlertAction!) -> Void /*indicate the start of the body*/ in

            // The alter message
            let alterMessage = UIAlertController(title: "Service Unavaliable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
            // The finish action
            alterMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alterMessage, animated: true, completion: nil)
        }
        // Use callActionHanlder as handler instead of nil
        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .default, handler: callActionHanlder)
        optionMenu.addAction(callAction)
        
        // Add Check-in Action
        /*Another way to write Closure,better way*/
        let checkInAction = UIAlertAction(title: "Check In", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            self.restaurantIsVisited[indexPath.row] = true
        })
        optionMenu.addAction(checkInAction)
        //呈现表单
        present(optionMenu, animated: true, completion: nil)
        // deselect the rows
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    // debug
    var restaurantIsVisited = Array(repeating: false,count: 21  )
    
}



