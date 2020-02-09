//
//  ProfileViewController.swift
//  Stylish-ios
//
//  Created by 黃瓘閎 on 2020/2/9.
//  Copyright © 2020 黃瓘閎. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    var fullScreenSize :CGSize!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullScreenSize = UIScreen.main.bounds.size
        
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 5,left: 5,bottom: 5,right: 5)
        
        layout.minimumLineSpacing = 5
        
        layout.itemSize = CGSize(width: CGFloat(fullScreenSize.width)/3 - 10.0,height: CGFloat(fullScreenSize.width)/3 - 10.0)
        
        layout.headerReferenceSize = CGSize(width: fullScreenSize.width, height: 40)
        
        layout.footerReferenceSize = CGSize(width: fullScreenSize.width, height: 40)
        
        let myCollectionView = UICollectionView(frame: CGRect(
            x: 0, y: 20,
            width: fullScreenSize.width,
            height: fullScreenSize.height - 20),
                                                collectionViewLayout: layout)
        
        myCollectionView.register(
            MyCollectionViewCell.self,
            forCellWithReuseIdentifier: "Cell")
        
        myCollectionView.register(
            UICollectionReusableView.self,
            forSupplementaryViewOfKind:
            UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "Header")
        
        myCollectionView.register(
            UICollectionReusableView.self,
            forSupplementaryViewOfKind:
            UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: "Footer")
        
        // 設置委任對象
        myCollectionView.delegate = self
        myCollectionView.dataSource = self

        // 加入畫面中
        self.view.addSubview(myCollectionView)
        
        print("Huang ViewDidLoad")

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print("Huang numberOfItemsInSection")
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
         print("你選擇了第 \(indexPath.section + 1) 組的")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell =
            collectionView.dequeueReusableCell(
                withReuseIdentifier: "Cell", for: indexPath)  as! MyCollectionViewCell
        
        cell.titleLabel.text = "0\(indexPath.item + 1)"
        
        print("Huang cell")

        return cell
    }
}
