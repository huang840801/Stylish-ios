//
//  HotsCellTableViewCell.swift
//  Stylish-ios
//
//  Created by 黃瓘閎 on 2019/11/6.
//  Copyright © 2019 黃瓘閎. All rights reserved.
//

import UIKit

class HotsCellTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var topImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
