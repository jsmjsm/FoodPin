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
        
        /*shorten the width of cells on iPad 调整在iPad上的显示*/
        tableView.cellLayoutMarginsFollowReadableWidth = true
		
		/*在导航列中启用较大的标题*/
		navigationController?.navigationBar.prefersLargeTitles = true
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell //强制转换

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

	
//    // MARK: - Table view delegate
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        // Create an option menu as an action sheet
//        // 建立一个类似动作清单选择列表
//        // There are two ways to display the Menu: ActionSheet and Altert
//        // .actionSheet = UIAlertControllerStyle.actionSheet
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
//
//        // 配置iPad上的 UIPopoverPresentationController 物件
//        if let popoverController = optionMenu.popoverPresentationController {
//            if let cell = tableView.cellForRow(at: indexPath) {
//                popoverController.sourceView = cell
//                popoverController.sourceRect = cell.bounds
//            }
//        }
//
//        // Add actions to the menu
//        // 加入到动作选单中
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)// Use addAction to add the cancleAction to the Menu
//        optionMenu.addAction(cancelAction)
//
//        // ***an examole of Closure***
//        // Add Call action
//        // 🔑 闭包
//        let callActionHandler = { (action:UIAlertAction!) -> Void in
//            // The alter message
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
//            // The finish action
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alertMessage, animated: true, completion: nil)
//        }
//
//        // Use callActionHanlder as handler instead of nil
//        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
//        optionMenu.addAction(callAction)
//
//        // Solution to exercise #1
//        // ---
//        // Determine the action tile by examining the status of restaurantIsVisited[indexPath.row]
//        // If it is set to true, we set the title "Undo Check in".
//
//        let checkActionTitle = (restaurantIsVisited[indexPath.row]) ? "Undo Check in" : "Check in"
//
//        // Check-in action
//        // Add Check-in Action
//        /*Another way to write Closure,better way*/
//        let checkInAction = UIAlertAction(title: checkActionTitle, style: .default, handler: {
//            (action:UIAlertAction!) -> Void in
//
//            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
//
//            // 更新访问
//            self.restaurantIsVisited[indexPath.row] = (self.restaurantIsVisited[indexPath.row]) ? false : true
//
//            // Solution to exercise #1
//            // ---
//            // Toggle the accessoryType and the value of restaurantIsVisited[indexPath.row]
//            // If the value of self.restaurantIsVisited[indexPath.row] is true, we set the accessory type to .none.
//
//            // cell?.accessoryType = (self.restaurantIsVisited[indexPath.row]) ? .none : .checkmark
//
//            // Solution to exercise #2
//            // ---
//            // Use the isHidden property to control the appearance of the heart icon
//
//            cell.heartImageView.isHidden = self.restaurantIsVisited[indexPath.row] ? false : true
//        })
//        optionMenu.addAction(checkInAction)
//
//        // Display the menu 呈现选单
//        present(optionMenu, animated: true, completion: nil)
//
//        // Deselect the row 反选列
//        tableView.deselectRow(at: indexPath, animated: false)
//    }

//    // MARK: 滑动删除
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//        if editingStyle == .delete{
//            // delete row from the data source
//            restaurantNames.remove(at: indexPath.row)
//            restaurantLocations.remove(at: indexPath.row)
//            restaurantTypes.remove(at: indexPath.row)
//            restaurantImages.remove(at: indexPath.row)
//
//        }
//
//        // tableView.reloadData() // reload 的方法有点暴力
//
//        //从表格时图中移除特定列 用 deleteRows 的方法
//        tableView.deleteRows(at: [indexPath], with: .automatic)
//
////        print("Total item: \(restaurantNames.count)")
////        for name in restaurantNames{
////            print(name)
////        }
//
//
//    }
    
    //  MARK: 向左滑动
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // delete action
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
            (action, sourceView, CompletionHandler) in
            // 从资料源删除列
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            self.restaurantTypes.remove(at: indexPath.row)
            self.restaurantImages.remove(at: indexPath.row)
            self.restaurantIsVisited.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            // 呼叫完成处理器来解除动作按钮
            CompletionHandler(true)
        }
        
        // share action
        let shareAction = UIContextualAction(style: .normal, title: "Share"){ (action, sourceView, completionHandler) in
            let deafultText = "Just checking in at " + self.restaurantNames[indexPath.row]
            
            // config the controller
            let activityController : UIActivityViewController
            
            if let imageToShare = UIImage(named: self.restaurantImages[indexPath.row]){
                activityController = UIActivityViewController(activityItems: [deafultText, imageToShare], applicationActivities: nil)
            }else{
                activityController = UIActivityViewController(activityItems: [deafultText], applicationActivities: nil)
            }
            
            // 为 ipad 调整
            if let popoverController = activityController.popoverPresentationController{
                if let cell = tableView.cellForRow(at: indexPath){
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            
            
            self.present(activityController,animated: true, completion: nil)
            
            completionHandler(true)
            
        }
        
        //   adjust the pattern style
        deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(named: "delete")
        
        shareAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(named: "share")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction,shareAction])
        
    return swipeConfiguration
    }
    
        
    
    
    
    
    // class end
}
