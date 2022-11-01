//
//  SecondViewController.swift
//  Lesson 10 [UITabBarController + UITabBarItem]
//
//  Created by Ильгам Нафиков on 01.11.2022.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Second ViewController"
        
        var tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
        self.tabBarItem = tabBarItem

        self.view.backgroundColor = UIColor.white
    }

}
