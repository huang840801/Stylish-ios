//
//  MyCollectionViewCell.swift
//  Stylish-ios
//
//  Created by 黃瓘閎 on 2020/2/9.
//  Copyright © 2020 黃瓘閎. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    var titleLabel:UILabel!
    var imageView:UIImageView!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        imageView = UIImageView(frame: CGRect(
            x: 0, y: 0,
            width: 30, height: 30))
        
        imageView.center = CGPoint(x: self.bounds.size.width / 2,
                                   y: self.bounds.size.height / 2)
        self.addSubview(imageView)
            
        // 建立一個 UILabel
        titleLabel = UILabel(frame:CGRect(
            x: 0, y: 50, width: self.bounds.size.width, height: 50))
        titleLabel.textAlignment = .center
        titleLabel.contentMode = .bottom
        titleLabel.textColor = UIColor.black
        titleLabel.font = titleLabel.font.withSize(15)

        self.addSubview(titleLabel)        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
