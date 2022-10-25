//
//  ViewController.swift
//  Lesson3 [UISwitch + selector]
//
//  Created by Ильгам Нафиков on 20.08.2022.
//

import UIKit

class ViewController: UIViewController {

    let genderSwitch = UISwitch()
    let genderLabel = UILabel()
    let sumbitButton = UIButton(type: .custom)
    var isMan: Bool = false
    var alertIsPresented: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.genderLabel.translatesAutoresizingMaskIntoConstraints = false
        self.genderSwitch.translatesAutoresizingMaskIntoConstraints = false
        self.sumbitButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.genderLabel.text = "You are the man?"
        
        self.genderSwitch.layer.cornerRadius = self.genderSwitch.frame.height / 2
        self.genderSwitch.backgroundColor = UIColor.red
        self.genderSwitch.onTintColor = UIColor.blue
        
        self.sumbitButton.frame.size = CGSize(width: 900, height: 20)
        self.sumbitButton.setTitle("Sumbit", for: UIControl.State.normal)
        self.sumbitButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        self.sumbitButton.backgroundColor = UIColor.black
        self.sumbitButton.layer.cornerRadius = 10
        self.sumbitButton.addTarget(self, action: #selector(stateUpdate), for: UIControl.Event.touchUpInside)
        
        self.view.addSubview(self.genderLabel)
        self.view.addSubview(self.genderSwitch)
        self.view.addSubview(self.sumbitButton)
        
        let verticalConstraintGenderLabel = NSLayoutConstraint(item: genderLabel, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let horizontalConstraintGenderLabel = NSLayoutConstraint(item: genderLabel, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: genderSwitch, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -50)
        
        let horizontalConstraintSwitch = NSLayoutConstraint(item: genderSwitch, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        let verticalConstraintSwitch = NSLayoutConstraint(item: genderSwitch, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        
        let horizontalConstraintButton = NSLayoutConstraint(item: sumbitButton, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: genderSwitch, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 50)
        let verticalConstraintButton = NSLayoutConstraint(item: sumbitButton, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)

        NSLayoutConstraint.activate([verticalConstraintGenderLabel, horizontalConstraintGenderLabel, horizontalConstraintSwitch, verticalConstraintSwitch, horizontalConstraintButton, verticalConstraintButton])
        
        self.genderSwitch.addTarget(self, action: #selector(stateChange(paramTarget:)), for: .valueChanged)
        
    }
    
    @objc func stateChange(paramTarget: UISwitch) {
        isMan = paramTarget.isOn ? true : false
    }
    
    @objc func stateUpdate(object: Bool) {
        self.alertIsPresented = true
        let alertSumbit = UIAlertController(title: "Choose sumbit", message: "You have selected \(self.isMan == true ? "man" : "girl")", preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { action in
        }
        alertSumbit.addAction(alertAction)
        self.present(alertSumbit, animated: false)
        
    }
    


}

