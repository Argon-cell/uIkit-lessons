//
//  ViewController.swift
//  Lesson 12 [UIImageView + UIImage]
//
//  Created by Ильгам Нафиков on 01.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myImageView.layer.borderWidth = 2
        myImageView.layer.borderColor = UIColor.red.cgColor
        myImageView.layer.cornerRadius = 50
        myImageView.contentMode = .scaleAspectFit
        
        // Do any additional setup after loading the view.
    }


}

