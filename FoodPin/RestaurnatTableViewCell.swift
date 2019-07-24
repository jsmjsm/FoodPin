//
//  RestaurnatTableViewCell.swift
//  FoodPin
//
//  Created by Levy Pan on 7/14/19.
//  Copyright © 2019 LVP. All rights reserved.
//

import UIKit

class RestaurnatTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet var nameLabel: UILabel! //名称标签
    @IBOutlet var locationLabel: UILabel! //位置标签
    @IBOutlet var typeLabel: UILabel! //类型标签
    @IBOutlet var thumbnailImageView: UIImageView! //缩略图
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
