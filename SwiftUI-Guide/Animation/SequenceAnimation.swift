//
//  SequenceAnimation.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/25.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct SequenceAnimation: View {
  @State private var offsetX: CGFloat = 20
  
  let colors: [Color] = [.red, .orange, .yellow, .green, .blue]
  let animations: [Animation] = [
    Animation.interpolatingSpring(stiffness: 100, damping: 10).delay(0.0),
    Animation.interpolatingSpring(stiffness: 100, damping: 10).delay(0.3),
    Animation.interpolatingSpring(stiffness: 100, damping: 10).delay(0.6),
    Animation.interpolatingSpring(stiffness: 100, damping: 10).delay(0.9),
    Animation.interpolatingSpring(stiffness: 100, damping: 10).delay(1.2),
  ]
  
  var body: some View {
    VStack {
      Button(action: {
        self.offsetX = self.offsetX == 20 ? UIScreen.main.bounds.width / 2 : 20
      }) {
        Text("序列动画")
      }
      List(0 ..< colors.count) {
        Rectangle()
          .fill(self.colors[$0])
          .frame(width: 50, height: 50)
          .offset(x: self.offsetX, y: 0)
          .animation(self.animations[$0])
      }
    }
  }
}

struct SequenceAnimation_Previews: PreviewProvider {
  static var previews: some View {
    SequenceAnimation()
  }
}
