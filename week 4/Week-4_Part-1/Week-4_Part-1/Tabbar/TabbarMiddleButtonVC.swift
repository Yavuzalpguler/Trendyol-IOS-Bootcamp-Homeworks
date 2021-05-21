//
//  TabbarMiddleButtonVC.swift
//  Week-4_Part-1
//
//  Created by Yavuz Alp GÜLER on 14.05.2021.
//

import UIKit
@IBDesignable

class TabbarMiddleButtonVC: UITabBarController {



    override func viewDidLoad() {
            super.viewDidLoad()

            let controller1 = UIViewController()
            controller1.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
            let nav1 = UINavigationController(rootViewController: controller1)

            let controller2 = UIViewController()
            controller2.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
            let nav2 = UINavigationController(rootViewController: controller2)

            let controller3 = UIViewController()
            let nav3 = UINavigationController(rootViewController: controller3)
            nav3.title = ""

            let controller4 = UIViewController()
            controller4.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 4)
            let nav4 = UINavigationController(rootViewController: controller4)

            let controller5 = UIViewController()
            controller5.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 5)
            let nav5 = UINavigationController(rootViewController: controller5)

            viewControllers = [nav1, nav2, nav3, nav4, nav5]
            setupMiddleButton()
        }

        func setupMiddleButton() {
            let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
            var menuButtonFrame = menuButton.frame
            menuButtonFrame.origin.y = view.bounds.height - menuButtonFrame.height - 50
            menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
            menuButton.frame = menuButtonFrame

            menuButton.backgroundColor = UIColor.red
            menuButton.layer.cornerRadius = menuButtonFrame.height/2
            view.addSubview(menuButton)

            menuButton.setImage(UIImage(named: "example"), for: .normal)
            menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)

            view.layoutIfNeeded()
        }


        // MARK: - Actions

        @objc private func menuButtonAction(sender: UIButton) {
            selectedIndex = 2
        }
    }
    

   
