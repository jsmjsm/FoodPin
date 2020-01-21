//
//  Restaurant.swift
//  FoodPin
//
//  Created by Levy Pan on 1/21/20.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import Foundation
class Restaurant {
	var name: String
	var type: String
	var location: String
	var image: String
	var isVisited: Bool
	
	// 指定初始化（构造函数
	init (name: String, type: String, location: String, image: String, isVisited: Bool){
		self.name = name
		self.type = type
		self.location = location
		self.image = image
		self.isVisited = isVisited
	}
	
	// 便利初始化（构造函数载
	convenience init (){
		self.init(name:"", type:"", location:"", image:"", isVisited:false )
	}
}
