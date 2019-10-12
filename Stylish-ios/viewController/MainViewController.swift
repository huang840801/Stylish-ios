//
//  MainViewController.swift
//  Stylish-ios
//
//  Created by 黃瓘閎 on 2019/10/11.
//  Copyright © 2019 黃瓘閎. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loaaading the view.
    }
    
    @IBAction func btnClick(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "segueNext", sender: self)
    }
    
  @IBAction func UnWind(for segue :UIStoryboardSegue)
 {
   print("unwind...")
 }
}

