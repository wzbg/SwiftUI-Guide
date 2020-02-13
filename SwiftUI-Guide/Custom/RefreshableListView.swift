//
//  RefreshableListView.swift
//  SwiftUI-Common
//
//  Created by huanbing on 2020/2/14.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct RefreshableListView: View {
  @State private var data = [Int]()
  
  func randomInt() -> Int {
    Int.random(in: Int.min ... Int.max)
  }
  
  var body: some View {
    RefreshableList(pullUp: {
      self.data.append(self.randomInt())
    }, pullDown: {
      self.data.insert(self.randomInt(), at: 0)
    }) {
      ForEach(self.data, id: \.self) {
        Text("\($0)")
      }
    }
  }
}

struct RefreshableListView_Previews: PreviewProvider {
  static var previews: some View {
    RefreshableListView()
  }
}
