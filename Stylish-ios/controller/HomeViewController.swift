//
//  HomeViewController.swift
//  Stylish-ios
//
//  Created by 黃瓘閎 on 2019/10/27.
//  Copyright © 2019 黃瓘閎. All rights reserved.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var hotList = [PromotedProducts]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("HomeViewController viewDidLoad")
        
        tableView.register(UINib.init(nibName: "HotsCellTableViewCell", bundle: nil), forCellReuseIdentifier: "hotsCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 300
        
        getHots()
    }
    
    // 必須實作的方法：每一組 section 有幾個 cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return hotList[section].products.count
    }
    
    // 必須實作的方法：每個 cell 要顯示的內容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "hotsCell", for: indexPath) as! HotsCellTableViewCell
        
        cell.title.text = hotList[indexPath.section].products[indexPath.row].title
        cell.subTitle.text = hotList[indexPath.section].products[indexPath.row].description
        
        let imageURL = URL(string: hotList[indexPath.section].products[indexPath.row].mainImage)
        cell.topImageView.kf.setImage(with: imageURL)

        return cell
    }
    
    // 有幾組 section
    func numberOfSections(in tableView: UITableView) -> Int {
        return hotList.count
    }
    
    // section 點擊事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let name = info[indexPath.section][indexPath.row]
//        print("row \(indexPath.section)， \(indexPath.row)")
//        print("選擇的是第 \(indexPath.section) 個 section 的第 \(indexPath.row) 個 cell，\(name)")
    }
    
    func getHots() {
        
        let hotsApi = StylishURL.MARKET_HOTS
           if let url = URL(string: hotsApi) {
               // GET
               URLSession.shared.dataTask(with: url) { (data, response, error) in
                   if let error = error {
                    
                       print("Error: \(error.localizedDescription)")
                    
                   } else if let response = response as? HTTPURLResponse,let data = data {
                    
                       print("Status code: \(response.statusCode)")
                       let decoder = JSONDecoder()
                       
                       if let hotsData = try? decoder.decode(HotsData.self, from: data) {
                           DispatchQueue.main.async{
                          
                            for hot in (hotsData.data){
                                
                                self.hotList.append(hot)
                            }
                            
                               self.tableView.reloadData()
                           }
                       }
                   }
               }.resume()
           } else {
               print("Invalid URL.")
           }
    }
}
