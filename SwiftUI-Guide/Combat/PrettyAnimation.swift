//
//  PrettyAnimation.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/27.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct PrettyAnimation: View {
  @State var isAnimation = false
  
  var body: some View {
    VStack(spacing: 100) {
      ZStack {
        CircleView(
          color: .red, offsetX: 80, offsetY: 0, scaleTo: 0.4, isAnimation: $isAnimation
        )
        CircleView(
          color: .blue, offsetX: -80, offsetY: 0, scaleTo: 0.3, isAnimation: $isAnimation
        )
        CircleView(
          color: .yellow, offsetX: 0, offsetY: 80, scaleTo: 0.2, isAnimation: $isAnimation
        )
        CircleView(
          color: .green, offsetX: 0, offsetY: -80, scaleTo: 0.1, isAnimation: $isAnimation
        )
      }
      Button("启动") {
        self.isAnimation.toggle()
      }
    }
  }
}

struct PrettyAnimation_Previews: PreviewProvider {
  static var previews: some View {
    PrettyAnimation()
  }
}

struct CircleView: View {
  var color: Color
  var offsetX: CGFloat
  var offsetY: CGFloat
  var scaleTo: CGFloat
  @Binding var isAnimation: Bool
  
  var body: some View {
    Circle()
      .frame(width: 160, height: 160)
      .foregroundColor(color)
      .opacity(0.5)
      .offset(x: isAnimation ? 0 : offsetX, y: isAnimation ? 0 : offsetY)
      .rotationEffect(.degrees(isAnimation ? 360 : 0))
      .scaleEffect(isAnimation ? scaleTo : 1)
      .animation(Animation.easeInOut(duration: 3).repeatForever())
  }
}
