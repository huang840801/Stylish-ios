//
//  HomeViewController.swift
//  Stylish-ios
//
//  Created by 黃瓘閎 on 2019/10/27.
//  Copyright © 2019 黃瓘閎. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    var hotList = [PromotedProducts]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("HomeViewController viewDidLoad")
        
        tableView.register(UINib.init(nibName: "HotsCellTableViewCell", bundle: nil), forCellReuseIdentifier: "hotsCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 200
        
        getCoffeeData()
    }
    
    // 必須實作的方法：每一組 section 有幾個 cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return shopName.count
    }
    
    // 必須實作的方法：每個 cell 要顯示的內容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        // 取得 tableView 目前使用的 cell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "hotsCell", for: indexPath) as! HotsCellTableViewCell
        cell.title.text = shopName[indexPath.row]
        cell.title.numberOfLines = 0
        
        return cell
    }
    
    // 有幾組 section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // section 點擊事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let name = info[indexPath.section][indexPath.row]
//        print("row \(indexPath.section)， \(indexPath.row)")
//        print("選擇的是第 \(indexPath.section) 個 section 的第 \(indexPath.row) 個 cell，\(name)")
    }
    
    // 每個 section 的標題
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        let title = section == 0 ? "籃球" : "棒球"
        return title
    }
    
    var shopName:[String] = []
    var shopCity:[String] = []
    
    func getCoffeeData() {
        let address = "https://cafenomad.tw/api/v1.2/cafes/taipei"
        if let url = URL(string: address) {
            // GET
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if let response = response as? HTTPURLResponse,let data = data {
                    print("Status code: \(response.statusCode)")
                    let decoder = JSONDecoder()
                    
                    if let coffeeData = try? decoder.decode([CoffeeData].self, from: data) {
                        DispatchQueue.main.async{
                            for coffee in coffeeData {
                                self.shopName.append(coffee.name)
                                self.shopCity.append(coffee.city)
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

struct CoffeeData: Decodable {
    var name: String
    var city: String
}
