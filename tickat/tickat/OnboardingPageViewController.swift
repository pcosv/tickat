//
//  OnboardingPageViewController.swift
//  tickat
//
//  Created by Flávia on 27/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import UIKit

class OnboardingPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    // Array containing our pages
    lazy var orderedOnboardingPages: [UIViewController] = {
        return [self.newViewController(viewController: "onboardingPage1"),
                self.newViewController(viewController: "onboardingPage2"),
                self.newViewController(viewController: "onboardingPage3")]
    }()
    
    var pageControlDots = UIPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.dataSource = self
        if let firstPageViewController = orderedOnboardingPages.first {
            setViewControllers([firstPageViewController], direction: .forward, animated: true, completion: nil)
        }
        
        self.delegate = self
        configurePageControl()
        
    }
    
    // dots which tell us which page are we in
    func configurePageControl() {
        pageControlDots = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
        pageControlDots.numberOfPages = orderedOnboardingPages.count
        pageControlDots.currentPage = 0
        pageControlDots.tintColor = UIColor.black
        pageControlDots.pageIndicatorTintColor = UIColor.white
        pageControlDots.currentPageIndicatorTintColor = UIColor.yellow
        self.view.addSubview(pageControlDots)
    }
    
    func newViewController(viewController: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedOnboardingPages.index(of: viewController) else {
        return nil
    }
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            //return orderedOnboardingPages.last
            return nil
        }
        
        guard orderedOnboardingPages.count > previousIndex else {
            return nil
        }
    
        return orderedOnboardingPages[previousIndex]
}

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedOnboardingPages.index(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        
        guard orderedOnboardingPages.count != nextIndex else {
            //return orderedOnboardingPages.first
            return nil
        }
        
        guard orderedOnboardingPages.count > nextIndex else {
            return nil
        }
        
        return orderedOnboardingPages[nextIndex]
}
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageViewController = pageViewController.viewControllers![0]
        self.pageControlDots.currentPage = orderedOnboardingPages.index(of: pageViewController)!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
