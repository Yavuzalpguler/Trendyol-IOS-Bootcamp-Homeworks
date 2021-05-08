//
//  PageViewController.swift
//  Week-3_Part-1
//
//  Created by Kerim Caglar on 1.05.2021.
//

import UIKit

class PageViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var controllers = [UIViewController]()
    
    var vc: UIPageViewController!
    
    var currentIndex: Int?
    
    private var pendingIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
       
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .red
        controllers.append(vc1)
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .blue
        controllers.append(vc2)
        
        let vc3 = UIViewController()
        vc3.view.backgroundColor = .green
        controllers.append(vc3)
        
        guard let first = controllers.first else { return }
        
        vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        vc.dataSource = self
        vc.delegate = self
        vc.setViewControllers([first], direction: .forward, animated: true, completion: nil)
        
        view.addSubview(vc.view)
        view.bringSubviewToFront(pageControl)
        pageControl.numberOfPages = controllers.count
        pageControl.currentPage = 0
    }
    
    
}

extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.firstIndex(of: viewController), index > 0 else { return nil}
        
        let prev = index - 1
        return controllers[prev]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = controllers.firstIndex(of: viewController), index < (controllers.count - 1) else { return nil}
        
        let next = index + 1
        return controllers[next]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        pendingIndex = controllers.firstIndex(of: pendingViewControllers.first!)
        }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            currentIndex = pendingIndex
            if let index = currentIndex {
                pageControl.currentPage = index
            }
        }
    }

    
}

//MARK: UIViewController yaşam döngüsünü araştırıp her bir methodu kendi cümlelerinizle özetleyiniz
//MARK: PageControll kullanarak active sayfayı belirleyiniz(8 Mayıs)
