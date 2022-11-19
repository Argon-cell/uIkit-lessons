//
//  ViewController.swift
//  UIattachmentBehavior]
//
//  Created by Ильгам Нафиков on 19.11.2022.
//

import UIKit

class ViewController: UIViewController {

    //UIAttachmentBehavior - привязка
    //UISnapBehavior - снимок
    
    var squareView = UIView()
    var squareViewAnnchorView = UIView()
    var anchorView = UIView()
    var animator = UIDynamicAnimator()
    var attachmentBehavior: UIAttachmentBehavior?
    
    var snapBehavior: UISnapBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        createSmallSquareView()
//        createGestureRecognizer()
//        createAnchorView()
//        createAnimationAndBehaviors()
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        createGestureRecognizer2()
        createSmallSquareView2()
        createAnimatorAndBehaviors2()
    }
    
    
    //Cоздадим простой тап гестуре)
    func createGestureRecognizer2() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(paramTap:)))
        view.addGestureRecognizer(tap)
    }
    
    //Создание квадрата
    func createSmallSquareView2() {
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.backgroundColor = .green
        squareView.center = view.center
        view.addSubview(squareView)
    }
    
    //Создание аниматора и тряски
    func createAnimatorAndBehaviors2() {
        animator = UIDynamicAnimator(referenceView: view)
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        
        snapBehavior = UISnapBehavior(item: squareView, snapTo: squareView.center)
        snapBehavior?.damping = 0.5
        animator.addBehavior(collision)
        animator.addBehavior(snapBehavior!)
    }
    
    //Определяет где тыкнут палец
    @objc func handleTap(paramTap: UITapGestureRecognizer) {
        let tapPoint = paramTap.location(in: view)
        
        if let snapBehavior = snapBehavior {
            animator.removeBehavior(snapBehavior)
        }
        snapBehavior = UISnapBehavior(item: squareView, snapTo: tapPoint)
        snapBehavior?.damping = 0.5 //Средняя осициляция
        animator.addBehavior(snapBehavior!)
    }
    
    
    //Создаем квадрат и в нем еще один
    func createSmallSquareView() {
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.backgroundColor = .green
        squareView.center = view.center
        squareViewAnnchorView = UIView(frame: CGRect(x: 60, y: 0, width: 20, height: 20))
        squareViewAnnchorView.backgroundColor = .brown
        squareView.addSubview(squareViewAnnchorView)
        view.addSubview(squareView)
    }
    
    //View с точкой привязки
    func createAnchorView() {
        anchorView = UIView(frame: CGRect(x: 120, y: 120, width: 20, height: 20))
        anchorView.backgroundColor = .red
        view.addSubview(anchorView)
    }
    
    //Создадим регистратор жестов панорамирования
    func createGestureRecognizer() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(paramPan:)))
        view.addGestureRecognizer(panGestureRecognizer)
    }
    
    //Создаем столконвение и прикрепление
    func createAnimationAndBehaviors() {
        animator = UIDynamicAnimator(referenceView: view)
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        attachmentBehavior = UIAttachmentBehavior(item: squareView, attachedToAnchor: anchorView.center)
        animator.addBehavior(collision)
        animator.addBehavior(attachmentBehavior!)
        
    }
    
    //Определяет где палец туда красный квадрат а потом привязка к большому
    @objc func handlePan(paramPan: UIPanGestureRecognizer) {
        let tapPoint = paramPan.location(in: view)
        print(tapPoint)
        attachmentBehavior?.anchorPoint = tapPoint
        anchorView.center = tapPoint
    }


}

