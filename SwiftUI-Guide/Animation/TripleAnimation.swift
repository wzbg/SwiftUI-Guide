//
//  Triple.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/25.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct TripleAnimation: View {
  @State private var angle = 0.0
  @State private var scale: CGFloat = 0
  @State private var offsetY: CGFloat = -200
  
  var body: some View {
    VStack {
      Image("logo")
        .offset(x: 0, y: offsetY)
        .scaleEffect(scale)
        .rotation3DEffect(.init(degrees: angle), axis: (x: 0, y: 1, z: 0))
        .animation(.interpolatingSpring(stiffness: 100, damping: 10))
      Divider()
        .fixedSize()
      Button(action: {
        if (self.angle == 0) {
          self.angle = 360 * 10
          self.scale = 1
          self.offsetY = 0
        }
      }) {
        Text("三合一组合动画")
      }
    }
  }
}

struct TripleAnimation_Previews: PreviewProvider {
  static var previews: some View {
      TripleAnimation()
  }
}
