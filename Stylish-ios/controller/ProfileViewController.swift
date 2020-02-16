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
    
    var imageList = ["Icons_24px_AwaitingPayment.png",
                     "Icons_24px_AwaitingShipment.png",
                     "Icons_24px_Shipped.png",
                     "Icons_24px_AwaitingReview.png",
                     "Icons_24px_Exchange.png",
                     "Icons_24px_Starred.png",
                     "Icons_24px_Notification.png",
                     "Icons_24px_Refunded.png",
                     "Icons_24px_Address.png",
                     "Icons_24px_CustomerService.png",
                     "Icons_24px_SystemFeedback.png",
                     "Icons_24px_RegisterCellphone.png",
                     "Icons_24px_Settings.png"]
    var titleList = ["待付款","待出貨","待簽收","待評價","退換貨","收藏","貨到通知","帳戶退款","地址","客服訊息","系統回饋","手機綁定","設定"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullScreenSize = UIScreen.main.bounds.size
        
        let layout = UICollectionViewFlowLayout()
            
        let collectionView = UICollectionView(frame: CGRect(
            x: 0, y: 20,
            width: fullScreenSize.width,
            height: fullScreenSize.height),
            collectionViewLayout: layout)
        
        collectionView.register(
            MyCollectionViewCell.self,
            forCellWithReuseIdentifier: "Cell")
        
        collectionView.register(
            UICollectionReusableView.self,
            forSupplementaryViewOfKind:
            UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "Header")
        
        //頁面背景顏色
        collectionView.backgroundColor = UIColor.white
        // 設置委任對象
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // 加入畫面中
        self.view.addSubview(collectionView)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (section == 0){
            
            return 5
        } else {
            
            return 8
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let  reusableView =
            collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: "Header",
                for: indexPath)
        
        let title = UILabel(frame: CGRect(
            x: 16, y: 16,
            width: fullScreenSize.width, height: reusableView.bounds.size.height))
        
        title.font = title.font.withSize(20)
        title.textAlignment = .left
                
        if (indexPath.section == 0){
            
            title.text = "我的訂單"
            
            let detail = UILabel(frame: CGRect(
                x: -16, y: 16,
                width: fullScreenSize.width, height: reusableView.bounds.size.height))
            detail.textAlignment = .right
            detail.text = "查看全部";
            detail.textColor = UIColor.black
            
            reusableView.addSubview(detail)
        } else{
            
            title.text = "更多服務"
        }
        title.textColor = UIColor.black
        
        reusableView.addSubview(title)
        
        return reusableView
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("你選擇了第 \(indexPath.section + 1) 組的 \(indexPath.row )")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell =
            collectionView.dequeueReusableCell(
                withReuseIdentifier: "Cell", for: indexPath)  as! MyCollectionViewCell
        
        if (indexPath.section == 0){

            cell.titleLabel.text = titleList[indexPath.item]
            
            cell.imageView.image = UIImage(named: imageList[indexPath.item])
             
        } else{

            cell.titleLabel.text = titleList[indexPath.item + 5]
            
            cell.imageView.image = UIImage(named: imageList[indexPath.item + 5])
        }
        
        cell.backgroundColor = UIColor.white
        
        return cell
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {

            return CGSize(width: UIScreen.main.bounds.size.width / 5.0, height: 80.0)

        } else if indexPath.section == 1 {

            return CGSize(width: UIScreen.main.bounds.size.width / 4.0, height: 80.0)
        }

        return CGSize.zero
    }
    
//    func collectionView(
//        _ collectionView: UICollectionView,
//        layout collectionViewLayout: UICollectionViewLayout,
//        insetForSectionAt section: Int
//    ) -> UIEdgeInsets {
//
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {

        return 24.0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {

        return 0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {

        return CGSize(width: UIScreen.main.bounds.size.width, height: 48.0)
    }
}
