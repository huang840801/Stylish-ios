//
//  HomeViewController.swift
//  Stylish-ios
//
//  Created by 黃瓘閎 on 2019/10/27.
//  Copyright © 2019 黃瓘閎. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var info = [
        ["林書豪","陳信安","Kobe"],
        ["陳偉殷","王建民","陳金鋒","林智勝"]
    ]
    
    var hotList = [Hot]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("HomeViewController viewDidLoad")
        
        tableView.register(UINib.init(nibName: "HotsCellTableViewCell", bundle: nil), forCellReuseIdentifier: "hotsCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        if let urlStr = StylishURL.MARKET_HOTS.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlStr) {
            
            let task = URLSession.shared.dataTask(with: url) { (data, reponse, error) in
                let decoder = JSONDecoder()
                if let data = data, let hotList = try? decoder.decode([Hot].self, from: data) {
                    
                    self.hotList = hotList
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                    print("aaaa ", hotList[0].title)
                }
            }
            task.resume()
        }
    }
    
    // 必須實作的方法：每一組 section 有幾個 cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return info[section].count
    }
    
    // 必須實作的方法：每個 cell 要顯示的內容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 取得 tableView 目前使用的 cell
        let cell =
            tableView.dequeueReusableCell(
                withIdentifier: "hotsCell", for: indexPath) as! HotsCellTableViewCell
        
        print("tableView")
        
        cell.title.text = "test"

//        if let myLabel = cell.title {
//
//            print("tableView title ")
//
//            myLabel.text =
//            "\(info[indexPath.section][indexPath.row])"
//        }
        //        cell.accessoryType = .disclosureIndicator
        //
        //        // 顯示的內容
        //        if let myLabel = cell.textLabel {
        //            myLabel.text =
        //            "\(info[indexPath.section][indexPath.row])"
        //        }
        //
        return cell
    }
    
    // 有幾組 section
    func numberOfSections(in tableView: UITableView) -> Int {
        return info.count
    }
    
    // section 點擊事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let name = info[indexPath.section][indexPath.row]
        print("row \(indexPath.section)， \(indexPath.row)")
        print("選擇的是第 \(indexPath.section) 個 section 的第 \(indexPath.row) 個 cell，\(name)")
    }
    
    // 每個 section 的標題
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        let title = section == 0 ? "籃球" : "棒球"
        return title
    }
}
