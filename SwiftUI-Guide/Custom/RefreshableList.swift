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
  var pullUp: (() -> Void)?
  var pullDown: (() -> Void)?
  let content: () -> Content
  
  @State private var showPullUpText = ""
  @State private var showPullDownText = ""
  
  var body: some View {
    VStack {
      if pullDown != nil {
        Button(action: pullDown!) {
          Text(showPullDownText)
        }
      }
      List {
        content()
          .onAppear() {
            switch self.showPullUpText {
              case self.pullUpText.0:
                self.showPullUpText = self.pullUpText.2
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                  self.showPullUpText = ""
                }
              default: break
            }
          }
          .onDisappear() {
            self.showPullUpText = self.pullUpText.0
          }
      }
      if pullUp != nil {
        Button(action: pullUp!) {
          Text(showPullUpText)
        }
      }
    }
  }
}
