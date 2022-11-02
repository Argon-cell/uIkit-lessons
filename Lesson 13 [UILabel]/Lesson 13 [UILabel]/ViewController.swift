//
//  ViewController.swift
//  Lesson 13 [UILabel]
//
//  Created by Ильгам Нафиков on 01.11.2022.
//

import UIKit

class ViewController: UIViewController {

    var textLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel = UILabel(frame: CGRect(x: self.view.frame.width / 2.3, y: 100, width: 20, height: 50))
        textLabel.text = "Label2" // Сам текст
        textLabel.font = UIFont(name: "Menlo", size: 10) // Шрифт
        textLabel.textColor = UIColor.red // Цвет текста
        textLabel.shadowColor = UIColor.blue // Цвет тени
        textLabel.shadowOffset = CGSize(width: 1, height: 1) // Движение тени
        textLabel.textAlignment = .center // Центрирование текста
        textLabel.lineBreakMode = NSLineBreakMode.byTruncatingHead // Метод переноса строки
        textLabel.attributedText = NSAttributedString(string: "New text") // ???
        textLabel.highlightedTextColor = UIColor.green // Цвет подсветки
        textLabel.isHighlighted = true // Текст подсвечен или нет
        textLabel.isUserInteractionEnabled = true // Выключает или включает взаимодействие с текстом
        textLabel.isEnabled = true // Делает серым если выключен с атрибутами
        textLabel.numberOfLines = 3 // Количество строк текста
        textLabel.adjustsFontSizeToFitWidth = true // Подстраивает размер шрифта под размеры текста
        textLabel.baselineAdjustment = .alignCenters // ???
        textLabel.minimumScaleFactor = 1 // ???
        textLabel.allowsDefaultTighteningForTruncation = true // ???
        textLabel.lineBreakStrategy = .pushOut // Стратегия прерывания строки
        textLabel.preferredMaxLayoutWidth = 10 // Предпочтительная ширина в мультистроковой строки
        textLabel.showsExpansionTextWhenTruncated = true // ???
        self.view.addSubview(textLabel)
    }


}

