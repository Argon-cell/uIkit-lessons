//
//  ViewController.swift
//  Lesson 14 [UITextField + NotificationCenter]
//
//  Created by Ильгам Нафиков on 02.11.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var myTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        emailTextField.text = "n4fikov.ilgam@gamil.com" // Текст текстфилда
//        emailTextField.attributedText = NSAttributedString(string: "none") // ???
        emailTextField.textColor = UIColor.black
        emailTextField.keyboardType = .emailAddress
        passwordTextField.keyboardType = .default
//        emailTextField.font = UIFont(name: "Monaco", size: 14)
//        emailTextField.textAlignment = .center
        emailTextField.borderStyle = .roundedRect
        
        self.createTextField()
        
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldTextDidChange(ncParam: )), name: UITextField.textDidChangeNotification, object: nil)
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification, object: nil, queue: nil) { ns in
            self.view.frame.origin.y = -200
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { ns in
            self.view.frame.origin.y = 0
        }
    }
    
    //MARK: - CreateUI
    func createTextField() {
        let textFieldFrame = CGRect(x: 105, y: 580, width: 200, height: 31)
        
        var myTextField = UITextField(frame: textFieldFrame)
        myTextField.delegate = self
        myTextField.borderStyle = .roundedRect
        myTextField.contentVerticalAlignment = .center
        myTextField.textAlignment = .center
        myTextField.placeholder = "I swift developer"
//        myTextField.center = self.view.center
        myTextField.becomeFirstResponder()
        self.view.addSubview(myTextField)
    }
    //MARK: - UITextFieldDelegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("[textFieldShouldBeginEditing] Получен доступ к редактированию")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("[textFieldDidBeginEditing] Началось редактирование")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("[textFieldShouldEndEditing] Конец редактирование")
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("[textField] Вы ввели - \(string)")
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("Очистка символа")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("[textFieldShouldReturn] Нажата кнопка return")
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: - Nottifications
    
    @objc func textFieldTextDidChange(ncParam: NSNotification) {
        print("[UITextFieldTextDidChange] = \(ncParam)")
        
    }
    


}

