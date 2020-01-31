//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Levy Pan on 1/21/20.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
	
	@IBOutlet var tableView: UITableView!
	@IBOutlet var headerView: RestaurantDetailHeaderView!
	
    var restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
		
		// 设置标题视图
		headerView.nameLabel.text = restaurant.name
		headerView.typeLabel.text = restaurant.type
		headerView.headerImageView.image = UIImage(named: restaurant.image)
		headerView.heartImageView.isHidden = (restaurant.isVisited) ? false : true
    }
    



}


