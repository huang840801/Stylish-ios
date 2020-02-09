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
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        // 取得螢幕寬度
        let w = Double(
            UIScreen.main.bounds.size.width)
        
        // 建立一個 UILabel
        titleLabel = UILabel(frame:CGRect(
            x: 0, y: 0, width: w/3 - 10.0, height: 40))
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.orange
        self.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
