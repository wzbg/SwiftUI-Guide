//
//  PageControl.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/18.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct PageControl: UIViewRepresentable {
  var numberOfPages: Int
  @Binding var currentPage: Int
  
  class Coordinator: NSObject {
    var parent: PageControl
    
    init(_ pageControl: PageControl) {
      parent = pageControl
    }
    
    @objc func updateCurrentPage(sender: UIPageControl) {
      parent.currentPage = sender.currentPage
    }
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  func makeUIView(context: Context) -> UIPageControl {
    let pageControl = UIPageControl()
    pageControl.numberOfPages = numberOfPages
    pageControl.addTarget(
      context.coordinator,
      action: #selector(Coordinator.updateCurrentPage(sender:)),
      for: .valueChanged
    )
    return pageControl
  }
  
  func updateUIView(_ uiView: UIPageControl, context: Context) {
    uiView.currentPage = currentPage
  }
}
