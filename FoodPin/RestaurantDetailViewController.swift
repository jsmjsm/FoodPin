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
		
		restaruntImageView.image = UIImage(named: restaurantImageName)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
	
	@IBOutlet var restaruntImageView: UIImageView!

	var restaurantImageName = ""

	
	

}


