//
//  ViewController.swift
//  Lesson 15 [UIScrollView + Bonus]
//
//  Created by Ильгам Нафиков on 03.11.2022.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var myScrollView = UIScrollView()
    var myImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageToLoad = UIImage(named: "photo")
        myImageView = UIImageView(image: imageToLoad)
        myScrollView = UIScrollView(frame: self.view.bounds)
//        myScrollView.addSubview(myImageView)
        myScrollView.delegate = self

        let scrollViewRect = self.view.bounds
        
        let image1 = UIImage(named: "photo")
        let image2 = UIImage(named: "photo")
        let image3 = UIImage(named: "photo")
        
        myScrollView.isPagingEnabled = true
        myScrollView.contentSize = CGSize(width: scrollViewRect.size.width * 3, height: scrollViewRect.size.height)

        self.view.addSubview(myScrollView)
        
        var imageViewRect = self.view.bounds
        var imageView = self.newImageViewWithImage(paramImage: image1!, paramFrame: imageViewRect)
        myScrollView.addSubview(imageView)
        
        imageViewRect.origin.x += imageViewRect.size.width
        var image2View = self.newImageViewWithImage(paramImage: image2!, paramFrame: imageViewRect)
        myScrollView.addSubview(image2View)
        
        imageViewRect.origin.x += imageViewRect.size.width
        var image3View = self.newImageViewWithImage(paramImage: image3!, paramFrame: imageViewRect)
        myScrollView.addSubview(image3View)
        
    }
    
    //MARK: - UISCrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let p = "Начинается прокрутка"
        print(p)
        print(scrollView.contentOffset.x)
        self.myScrollView.alpha = 0.5
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let p = "Вызывается после прокрутки"
        print(p)
        self.myImageView.alpha = 0.1
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let p = "Гарантирует что вернет алфа к 1"
        print(p)
        self.myImageView.alpha = 1
    }
    
    func newImageViewWithImage(paramImage: UIImage, paramFrame: CGRect) -> UIImageView {
        let result = UIImageView(frame: paramFrame)
        result.contentMode = .scaleToFill
        result.image = paramImage
        return result
    }


}

