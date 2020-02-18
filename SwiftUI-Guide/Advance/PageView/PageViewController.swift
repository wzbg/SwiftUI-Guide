//
//  PageViewController.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/18.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct PageViewController: UIViewControllerRepresentable {
  var transitionStyle: UIPageViewController.TransitionStyle
  var navigationOrientation: UIPageViewController.NavigationOrientation
  var options: [UIPageViewController.OptionsKey : Any]?
  
  var direction: UIPageViewController.NavigationDirection = .forward
  var animated = true
  
  var controllers: [UIViewController]
  @Binding var currentPage: Int
  
  class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var parent: PageViewController
    
    init(_ pageViewController: PageViewController) {
      parent = pageViewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
      guard let index = parent.controllers.firstIndex(of: viewController) else {
        return nil
      }
      if index == 0 {
        return parent.controllers.last
      }
      return parent.controllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
      guard let index = parent.controllers.firstIndex(of: viewController) else {
        return nil
      }
      if index + 1 == parent.controllers.count {
        return parent.controllers.first
      }
      return parent.controllers[index + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
      if completed,
        let visibleViewController = pageViewController.viewControllers?.first,
        let index = parent.controllers.firstIndex(of: visibleViewController) {
        parent.currentPage = index
      }
    }
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  func makeUIViewController(context: Context) -> UIPageViewController {
    let pageViewController = UIPageViewController(transitionStyle: transitionStyle, navigationOrientation: navigationOrientation, options: options)
    pageViewController.dataSource = context.coordinator
    pageViewController.delegate = context.coordinator
    return pageViewController
  }
  
  func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
    pageViewController.setViewControllers([controllers[currentPage]], direction: direction, animated: animated)
  }
}
