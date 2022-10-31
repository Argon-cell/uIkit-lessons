//
//  SecondViewController.swift
//  Lesson 8 [UINavigationViewController]
//
//  Created by Ильгам Нафиков on 31.10.2022.
//

import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Second ViewController"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.perform(#selector(goBack), with: nil, afterDelay: 3)
    }
    
    @objc func goBack(){
//        self.navigationController?.popViewController(animated: true)
        var currentControllersArray = self.navigationController?.viewControllers
        currentControllersArray?.removeLast()
        if let newControllers = currentControllersArray {
            self.navigationController?.viewControllers = newControllers
        }
    }
}
