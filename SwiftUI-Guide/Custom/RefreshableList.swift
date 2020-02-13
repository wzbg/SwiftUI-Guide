//
//  RefreshableList.swift
//  SwiftUI-Common
//  Pull Down To Refresh
//  Pull Up To Load More
//
//  Created by huanbing on 2020/2/13.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct RefreshableList<Content: View>: View {
  var pullUpText = ("上拉可以加载更多", "松开立即加载更多", "正在加载更多数据...")
  var pullDownText = ("下拉可以刷新数据", "松开立即刷新数据", "正在刷新数据中...")
  let pullUp: (() -> Void)?
  let pullDown: (() -> Void)?
  let content: () -> Content
  
  var body: some View {
    VStack {
      if pullDown != nil {
        Button(action: pullDown!) {
          Text(pullDownText.0)
        }
      }
      List {
        content()
      }
      .onPreferenceChange(RefreshListPrefKey.self) {
        guard let bounds = $0.first?.bounds else { return }
        let offsetY = bounds.origin.y
        print("offsetY: \(offsetY)")
      }
      if pullUp != nil {
        Button(action: pullUp!) {
          Text(pullUpText.0)
        }
      }
    }
  }
}

//.onPreferenceChange(RefreshableKeyTypes.PrefKey.self) { values in
//  guard let bounds = values.first?.bounds else { return }
//  self.pullStatus = CGFloat((bounds.origin.y - 106) / 80)
//  self.refresh(offset: bounds.origin.y)
//}

//func refresh(offset: CGFloat) {
//  if(offset > 185 && self.showRefreshView == false) {
//    self.showRefreshView = true
//    DispatchQueue.main.async {
//      self.action()
//      DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//        self.showRefreshView = false
//      }
//    }
//  }
//}

struct RefreshListPrefKey: PreferenceKey {
  struct PrefValue: Equatable {
    let bounds: CGRect
  }
  
  static var defaultValue = [PrefValue]()
  static func reduce(value: inout [PrefValue], nextValue: () -> [PrefValue]) {
    value.append(contentsOf: nextValue())
  }
}
