//
//  ViewController.swift
//  Lesson 11 [UIButton]
//
//  Created by Ильгам Нафиков on 01.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in myButtons {
            button.tintColor = UIColor.systemPink
        }
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.tag == 3 {
            print("Кнопка 3 нажата")
        }
    }
    
}

