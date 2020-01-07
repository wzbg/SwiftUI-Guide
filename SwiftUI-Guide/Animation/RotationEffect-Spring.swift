//
//  RotationEffect-Spring.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct RotationEffect_Spring: View {
  @State var angle: Double = 0
  
  var body: some View {
    VStack {
      Image("logo")
        .rotationEffect(.init(degrees: angle))
        .animation(.spring())
      Divider()
        .fixedSize()
      Button(action: {
        self.angle += 90
      }) {
        Text("旋转效果")
      }
    }
  }
}

struct RotationEffect_Spring_Previews: PreviewProvider {
  static var previews: some View {
    RotationEffect_Spring()
  }
}
