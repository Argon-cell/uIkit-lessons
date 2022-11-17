//
//  MyViewController.swift
//  Lesson18 [UIPageViewController + lazy + constraints]
//
//  Created by Ильгам Нафиков on 15.11.2022.
//

import UIKit

class MyViewController: UIPageViewController {

    var cars = [CarsHelper]()
    let bmw = UIImage(named: "bmw")
    let audi = UIImage(named: "audi")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Cars"

        let firstCar = CarsHelper(name: "BMW", image: bmw!)
        let secondCar = CarsHelper(name: "Audi", image: audi!)
        
        cars.append(firstCar)
        cars.append(secondCar)
    }
    
    //MARK: - Create vc
    lazy var arrayViewController: [CarViewController] = {
        var carsVC = [CarViewController]()
        for car in cars {
            carsVC.append(CarViewController(carWith: car))
        }
        return carsVC
    }()
    
    //MARK: - init UIPageViewController
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
        self.view.backgroundColor = UIColor.green
        self.dataSource = self
        self.delegate = self
        setViewControllers([arrayViewController[0]], direction: .forward, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension MyViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else { return nil }
        if let index = arrayViewController.index(of: viewController) {
            if index > 0 {
                return arrayViewController[index - 1]
            }
        }
        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else { return nil }
        if let index = arrayViewController.index(of: viewController) {
            if index < cars.count - 1 {
                return arrayViewController[index + 1]
            }
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return cars.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
