//
//  CustomTabbarViewController.swift
//  Week-4_Part-1
//
//  Created by Yavuz Alp GÜLER on 14.05.2021.
//

import UIKit
class MyTabBarCtrl: UITabBarController, UITabBarControllerDelegate {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        
   }
    
    
}
