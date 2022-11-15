//
//  ViewController.swift
//  Lesson 17 [UIProgressView + Timer + private + final class]
//
//  Created by Ильгам Нафиков on 10.11.2022.
//

import UIKit

final class ViewController: UIViewController {

    private var progressView = UIProgressView()
    private var button = UIButton()
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createProgressView(progressView)
        createButton(button)
        createTimer()
        
    }
    //MARK: - Time
    private func createTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateProgressView),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    //MARK: - Selector
    @objc func updateProgressView() {
        if progressView.progress != 1.0 {
            progressView.progress += 0.1 / 1.0
        } else if progressView.progress == 1.0 {
            UIView.animate(withDuration: 0.7) {
                self.button.alpha = 1
                self.button.setTitle("Старт", for: .normal)
                self.timer.invalidate()
            }
        }
    }
    
    //MARK: - Methods
    private func createProgressView(_ progressView: UIProgressView) {
        progressView.progressViewStyle = .bar
        progressView.frame = CGRect(x: view.center.x,
                                    y: view.center.y,
                                    width: 150,
                                    height: 50)
        progressView.setProgress(0.0, animated: false)
        progressView.progressTintColor = UIColor.green
        progressView.trackTintColor =  UIColor.gray
        progressView.center = view.center
        view.addSubview(progressView)
    }
    
    private func createButton(_ button: UIButton) {
        button.frame = CGRect(x: view.center.x / 1.6,
                              y: view.center.y + 20,
                              width: 150,
                              height: 50)
        
        button.alpha = 0.2
        button.setTitle("Загрузка...", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        view.addSubview(button)
    }


}

