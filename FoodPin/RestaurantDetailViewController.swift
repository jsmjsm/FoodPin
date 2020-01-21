//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Levy Pan on 1/21/20.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		restaruntImageView.image = UIImage(named: restaurant.image)
//		restaurantNameLabel.text = restaurant.name
//		restaurantTypeLabel.text = restaurant.type
//		restaurantLocationLabel.text = restaurant.location
		// 关掉大标题
		navigationItem.largeTitleDisplayMode = .never
    }
	
	@IBOutlet var restaruntImageView: UIImageView!

	var restaurant = Restaurant()

}


