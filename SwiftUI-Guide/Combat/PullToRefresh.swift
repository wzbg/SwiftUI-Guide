//
//  PullToRefresh.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/27.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI
import SwiftUIPullToRefresh

struct PullToRefresh: View {
  @State var animals = [
    "🐭", "🐂", "🐯", "🐰", "🐲", "🐍",
    "🐎", "🐑", "🐒", "🐔", "🐶", "🐷"
  ]
  
  var body: some View {
    RefreshableNavigationView(title: "生肖", action: {
      self.animals += self.animals
    }) {
      ForEach(self.animals, id: \.self) { animal in
        VStack(alignment: .leading) {
          Text(animal)
          Divider()
        }
      }
    }
  }
}

struct PullToRefresh_Previews: PreviewProvider {
  static var previews: some View {
    PullToRefresh()
  }
}
