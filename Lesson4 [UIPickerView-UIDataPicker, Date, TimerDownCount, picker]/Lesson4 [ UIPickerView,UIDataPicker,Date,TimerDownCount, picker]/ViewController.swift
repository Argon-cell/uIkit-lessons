//
//  ViewController.swift
//  Lesson4 [ UIPickerView,UIDataPicker,Date,TimerDownCount, picker]
//
//  Created by Ильгам Нафиков on 02.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var picker = UIPickerView()
    var datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        picker.dataSource = self
        picker.delegate = self
        
        picker.center = CGPoint(x: view.center.x, y: view.center.y + 50)
        datePicker.center = CGPoint(x: view.center.x, y: view.center.y - 50)
        datePicker.datePickerMode = .date
        
        var oneYearTime = TimeInterval()
        oneYearTime = 365 * 24 * 60 * 60
        
        let date = Date()
        datePicker.minimumDate = date.addingTimeInterval(oneYearTime)
        datePicker.maximumDate = date.addingTimeInterval(oneYearTime * 2)
        
//        datePicker.countDownDuration = 2 * 60
        
        datePicker.addTarget(self, action: #selector(datePickerChange(pardamdatePicker:)), for: .valueChanged)
        
        self.view.addSubview(picker)
        self.view.addSubview(datePicker)
        
        
    }
    
    @objc func datePickerChange(pardamdatePicker: UIDatePicker) {
        print(pardamdatePicker, self.datePicker)
        if pardamdatePicker.isEqual(self.datePicker) {
            print("dateChanged: \(pardamdatePicker.date)")
        }
        
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Текст \(row)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
}

