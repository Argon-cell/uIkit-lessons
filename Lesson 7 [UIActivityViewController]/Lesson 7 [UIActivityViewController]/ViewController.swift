//
//  ViewController.swift
//  Lesson 7 [UIActivityViewController]
//
//  Created by Ильгам Нафиков on 26.10.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var activity: UIActivityViewController? = nil
    var textField = UITextField()
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createTextField()
        self.createButton()
        
        
    }
    
    //MARK: -Method
    func createButton() {
        self.button = UIButton(type: .roundedRect)
        self.button.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        self.button.center = CGPoint(x: 160, y: 350)
        self.button.setTitle("Поделиться", for: .normal)
        self.button.addTarget(self, action: #selector(hendleShare(paramSender:)), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    func createTextField(){
        self.textField.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
        self.textField.center = self.view.center
        self.textField.delegate = self
        self.textField.borderStyle = .roundedRect
        self.textField.placeholder = "Entry text"
        self.view.addSubview(textField)
    }
    
    @objc func hendleShare(paramSender: Any) {
        let text = self.textField.text
        
        if text?.count == 0 {
            let alertController = UIAlertController(title: nil, message: "Сначала скопируйте текст", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ок", style: .cancel)
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
        
        self.activity = UIActivityViewController(activityItems: [self.textField.text ?? "nil"], applicationActivities: nil)
        self.present(activity!, animated: true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        return true
    }


}

