//
//  PageView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/18.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
  var transitionStyle: UIPageViewController.TransitionStyle = .scroll
  var navigationOrientation: UIPageViewController.NavigationOrientation = .horizontal
  var viewControllers: [UIHostingController<Page>]
  var alignment: Alignment = .bottomTrailing
  @State private var currentPage = 0
  
  init(_ views: [Page]) {
    viewControllers = views.map({ UIHostingController(rootView: $0) })
  }
  
  var body: some View {
    ZStack(alignment: .bottomTrailing) {
      PageViewController(
        transitionStyle: transitionStyle,
        navigationOrientation: navigationOrientation,
        controllers: viewControllers,
        currentPage: $currentPage
      )
      PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
        .padding(.horizontal)
    }
  }
}

struct PageView_Previews: PreviewProvider {
  static var previews: some View {
    PageView([
      Rectangle().foregroundColor(.gray),
      Rectangle().foregroundColor(.red),
      Rectangle().foregroundColor(.green),
      Rectangle().foregroundColor(.blue),
      Rectangle().foregroundColor(.orange),
      Rectangle().foregroundColor(.yellow),
      Rectangle().foregroundColor(.pink),
      Rectangle().foregroundColor(.purple)
    ])
  }
}
