//
//  ViewController.swift
//  Lesson 8 [UINavigationViewController]
//
//  Created by Ильгам Нафиков on 31.10.2022.
//

import UIKit

class ViewController: UIViewController {

    var displaySecondViewController = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "First ViewController"
        
        self.displaySecondViewController = UIButton(type: .system)
        self.displaySecondViewController.setTitle("Second ViewController", for: .normal)
        self.displaySecondViewController.sizeToFit()
        self.displaySecondViewController.center = self.view.center
        self.displaySecondViewController.addTarget(self, action: #selector(openSecondViewController(target:)), for: .touchUpInside)
        self.view.addSubview(displaySecondViewController)
    }
    
    @objc func openSecondViewController(target: UIButton) {
        let secondViewController = SecondViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }

}

