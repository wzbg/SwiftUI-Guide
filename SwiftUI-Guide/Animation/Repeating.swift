//
//  Repeating.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Repeating: View {
  @State var angle = 0.0
  
  var animation: Animation {
    Animation.spring()
      .repeatForever()
//      .repeatForever(autoreverses: false)
//      .repeatCount(3)
  }
  
  var body: some View {
    VStack {
      Image("logo")
        .rotationEffect(.init(degrees: angle))
        .animation(animation)
      Divider()
        .fixedSize()
      Button(action: {
        self.angle += 45
      }) {
        Text("永远重复效果")
      }
    }
  }
}

struct Repeating_Previews: PreviewProvider {
  static var previews: some View {
    Repeating()
  }
}
