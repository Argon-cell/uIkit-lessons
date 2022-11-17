//
//  ViewController.swift
//  Lesson 19 [UIDynamicAnimator + UICollision + UIGravity +UIPushBehavior]
//
//  Created by Ильгам Нафиков on 17.11.2022.
//

import UIKit

class ViewController: UIViewController {
    //UIcollisionBehavior - обнаружение столконвений
    //UIGravityBehavior - обеспечивает тяготение
    //UIPushBehavior - реагирует на толчки
    //UISnapBehavior - крепит view к определенной точке
    
    var squareView = UIView()
    var squareViews = [UIDynamicItem]()
    var animator = UIDynamicAnimator()
    var pushBehavior = UIPushBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        createGestureRecognaizer()
        createSquareView()
        creationAnimationAndBehavior()
        
//        squareView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        squareView.backgroundColor = .green
//        squareView.center = view.center
//        view.addSubview(squareView)
//        animator = UIDynamicAnimator(referenceView: view)
//        let gravity = UIGravityBehavior(items: [squareView])
//        animator.addBehavior(gravity)
        
        
 //MARK: - part 2
//        let numberOfViews = 2
//        squareViews.reserveCapacity(numberOfViews)
//        let colors = [UIColor.red, UIColor.green]
//        var currentCenterPoint: CGPoint = view.center
//        let eachViewSize = CGSize(width: 50, height: 50)
//
//        for counter in 0..<numberOfViews {
//            let newView = UIView(frame: CGRect(x: 0, y: 0, width: eachViewSize.width, height: eachViewSize.height))
//            newView.backgroundColor = colors[counter]
//            newView.center = currentCenterPoint
//            currentCenterPoint.y += eachViewSize.height + 10
//            view.addSubview(newView)
//            squareViews.append(newView)
//        }
//
//        animator = UIDynamicAnimator(referenceView: view)
//
//        let gravity = UIGravityBehavior(items: squareViews)
//        animator.addBehavior(gravity)
//
//        let collusion = UICollisionBehavior(items: squareViews)
//        collusion.collisionDelegate = self
//        collusion.translatesReferenceBoundsIntoBoundary = true
//
//        collusion.addBoundary(withIdentifier: "bottomBoundary" as NSCopying,
//                              from: CGPoint(x: 0, y: view.bounds.size.height - 100),
//                              to: CGPoint(x: view.bounds.size.width, y: view.bounds.size.height - 100))
//
//        animator.addBehavior(collusion)
    }
    
    func createSquareView() {
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.backgroundColor = UIColor.green
        squareView.center = view.center
        view.addSubview(squareView)
    }
    
    func createGestureRecognaizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hendlerTap(paramTap:)))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func creationAnimationAndBehavior() {
        animator = UIDynamicAnimator(referenceView: view)
        let collusion = UICollisionBehavior(items: [squareView])
        collusion.translatesReferenceBoundsIntoBoundary = true
        pushBehavior = UIPushBehavior(items: [squareView], mode: .continuous)
        animator.addBehavior(collusion)
        animator.addBehavior(pushBehavior)
    }
    
    @objc func hendlerTap(paramTap: UITapGestureRecognizer) {
        let tapPoint: CGPoint = paramTap.location(in: view)
        let sqaureViewCenterPoint: CGPoint = squareView.center
        let deltaX: CGFloat = tapPoint.x - sqaureViewCenterPoint.x
        let deltaY: CGFloat = tapPoint.y - sqaureViewCenterPoint.y
        let angel: CGFloat = atan2(deltaY, deltaX)
        pushBehavior.angle = angel
        
        let disnanceBetweenTwoPoints: CGFloat = sqrt(pow(deltaX, 2.0) + pow(deltaY, 2.0))
        pushBehavior.magnitude = disnanceBetweenTwoPoints / 200
    }
}

extension ViewController: UICollisionBehaviorDelegate {
    func collisionBehavior(_ behavior: UICollisionBehavior, endedContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?) {
         
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        let identifier = identifier as? String
        let kBottomBoundary = "bottomBoundary"
        
        if identifier == kBottomBoundary {
            UIView.animate(withDuration: 1.0, animations: {
                let view = item as? UIView
                view?.backgroundColor = UIColor.red
                view?.alpha = 0.0
                view?.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            }, completion: { (finished) in
                let view = item as? UIView
                behavior.removeItem(item)
                view?.removeFromSuperview()
            })

        }
    }
    
}

