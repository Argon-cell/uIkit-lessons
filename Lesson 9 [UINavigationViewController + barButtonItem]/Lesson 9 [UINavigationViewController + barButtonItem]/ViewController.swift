//
//  ViewController.swift
//  Lesson 9 [UINavigationViewController + barButtonItem]
//
//  Created by Ильгам Нафиков on 01.11.2022.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController"
        createImageTitleView()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(perfrAdd(param:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(perfrAdd(param:)))
        
        let simpleSwitch = UISwitch()
        simpleSwitch.isOn = true
        simpleSwitch.addTarget(self, action: #selector(switchChanged(param:)), for: .valueChanged)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: simpleSwitch)
    }
    
    //MARK: - Method
    fileprivate func createImageTitleView() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "appleIcon")
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
    
    @objc func perfrAdd(param: UIBarButtonItem) {
        print("Add click")
    }
    
    @objc func switchChanged(param: UISwitch) {
        if param.isOn {
            print("Switch is on")
        } else {
            print("Switch is off")
        }
    }


}

