//
//  RefreshableListView.swift
//  SwiftUI-Common
//
//  Created by huanbing on 2020/2/14.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct RefreshableListView: View {
  @State private var data = [randomColor()]
  
  private static func randomColor() -> Color {
    Color(red: randomDouble(), green: randomDouble(), blue: randomDouble())
  }
  
  private static func randomDouble() -> Double {
    Double.random(in: 0 ... 1)
  }
  
  var body: some View {
    RefreshableList(pullUp: {
      self.data.append(Self.randomColor())
    }, pullDown: {
      self.data.insert(Self.randomColor(), at: 0)
    }) {
      ForEach(self.data, id: \.self) {
        Rectangle()
          .foregroundColor($0)
      }
    }
  }
}

struct RefreshableListView_Previews: PreviewProvider {
  static var previews: some View {
    RefreshableListView()
  }
}
