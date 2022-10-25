//
//  ViewController.swift
//  Lesson2 [UIAlertController]
//
//  Created by Ильгам Нафиков on 18.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentNumberLabel: UILabel!
    @IBOutlet weak var tryButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
    private var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        number = Int.random(in: 1...9)
        restartButton.isHidden = true
    }
    
    @IBAction func showAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Secret number", message: "Try to guess number", preferredStyle: .alert)
        let tryAction = UIAlertAction(title: "Try", style: .default) { (action) in
            let text = alertController.textFields?.first?.text ?? ""
            if let userNumber = Int(text) {
                if userNumber == self.number {
                    self.currentNumberLabel.text = "\(self.number)"
                    self.tryButton.isHidden = true
                    self.restartButton.isHidden = false
                } else {
                    self.currentNumberLabel.text = self.number > userNumber ? ">" : "<"
                }
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
        }
        
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(tryAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: false)
    }
    
    @IBAction func restartGame(_ sender: Any) {
        self.currentNumberLabel.text = "?"
        number = Int.random(in: 1...9)
        self.tryButton.isHidden = false
        self.restartButton.isHidden = true
    }


}

