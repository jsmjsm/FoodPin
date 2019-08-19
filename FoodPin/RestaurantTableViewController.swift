//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Levy Pan on 7/14/19.
//  Copyright © 2019 LVP. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]

    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]

    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]

    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]

    var restaurantIsVisited = Array(repeating: false, count: 21)

    override func viewDidLoad() {
        super.viewDidLoad()
        /*shorten the width of cells on iPad*/
        tableView.cellLayoutMarginsFollowReadableWidth = true
    }

    // MARK: - Table view data source

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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell

        // Configure the cell...
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]

        // Solution to Exercise #1
        // cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark : .none

        // Solution to Exercise #2
        // Use the isHidden property to control the appearance of the heart icon
        cell.heartImageView.isHidden = restaurantIsVisited[indexPath.row] ? false : true

        return cell
    }

    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // Create an option menu as an action sheet
        // 建立一个类似动作清单选择列表
        // There are two ways to display the Menu: ActionSheet and Altert
        // .actionSheet = UIAlertControllerStyle.actionSheet
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)

        if let popoverController = optionMenu.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }

        // Add actions to the menu
        // 加入到动作选单中
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)// Use addAction to add the cancleAction to the Menu
        optionMenu.addAction(cancelAction)

        // ***an examole of Closure***
        // Add Call action
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            // The alter message
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
            // The finish action
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }

        // Use callActionHanlder as handler instead of nil
        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)

        // Solution to exercise #1
        // ---
        // Determine the action tile by examining the status of restaurantIsVisited[indexPath.row]
        // If it is set to true, we set the title "Undo Check in".

        let checkActionTitle = (restaurantIsVisited[indexPath.row]) ? "Undo Check in" : "Check in"

        // Check-in action
        // Add Check-in Action
        /*Another way to write Closure,better way*/
        let checkInAction = UIAlertAction(title: checkActionTitle, style: .default, handler: {
            (action:UIAlertAction!) -> Void in

            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell

            self.restaurantIsVisited[indexPath.row] = (self.restaurantIsVisited[indexPath.row]) ? false : true

            // Solution to exercise #1
            // ---
            // Toggle the accessoryType and the value of restaurantIsVisited[indexPath.row]
            // If the value of self.restaurantIsVisited[indexPath.row] is true, we set the accessory type to .none.

            // cell?.accessoryType = (self.restaurantIsVisited[indexPath.row]) ? .none : .checkmark

            // Solution to exercise #2
            // ---
            // Use the isHidden property to control the appearance of the heart icon

            cell.heartImageView.isHidden = self.restaurantIsVisited[indexPath.row] ? false : true
        })
        optionMenu.addAction(checkInAction)

        // Display the menu
        present(optionMenu, animated: true, completion: nil)

        // Deselect the row
        tableView.deselectRow(at: indexPath, animated: false)
    }

    //11-MVC
    // swipe to delete
    // func: tableView(_:commit:forRowAt:)
    // delete the data but do not reload the table view
   /* override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete{
//            // delete the row from the data source
//            restaurantNames.remove(at: indexPath.row)
//            restaurantTypes.remove(at: indexPath.row)
//            restaurantLocations.remove(at: indexPath.row)
//            restaurantIsVisited.remove(at: indexPath.row)
//            restaurantImages.remove(at: indexPath.row)
//        }
    // to reload the table view
//        tableView.reloadData()
        
        // another way to reload the table ->
        tableView.deleteRows(at: [indexPath], with: .left)
        
    // use to debug
//        print("Total item:  \(restaurantNames.count)")
//        for name in restaurantNames{
//            print(name)
//        }
        
  }
    */
    
    // rebuild the delete func and add share func
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // UIContextualAction just like UIAlterAction
        let deleteAction = UIContextualAction(style: .destructive, title:"Delete"){
            (action,sourceView,completionHandler) in
            // delete the data from the dataSource
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantTypes.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            self.restaurantIsVisited.remove(at: indexPath.row)
            self.restaurantImages.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .left)
            
            //call the completionHandler to finish the aciton
            completionHandler(true)
        }
        let shareAction = UIContextualAction(style: .normal, title: "Share"){
            (action,sourceView,completionHandler) in
            let defaultText = "Just checking in at " + self.restaurantNames[indexPath.row]
           /*
            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            
            self.present(activityController,animated: true,completion: nil)
            
            completionHandler(true)
             */
            //allow the picture to be shared
            let activityController : UIActivityViewController
            
            if let imageToShare = UIImage(named: self.restaurantImages[indexPath.row]){
                activityController = UIActivityViewController(activityItems: [defaultText,imageToShare], applicationActivities: nil)
            }else{
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            
        self.present(activityController,animated: true,completion: nil)
            completionHandler(true)
            
        }
 
        let swipeActionsConfiguration = UISwipeActionsConfiguration(actions:[deleteAction,shareAction])
        // use swipeActionsConfiguration to return a button
        return swipeActionsConfiguration
 
            
    }


}
