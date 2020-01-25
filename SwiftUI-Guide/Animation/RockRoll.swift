//
//  Rotate.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/25.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct RockRoll: View {
  @State private var shouldRotate = false
  
  var body: some View {
    ZStack {
      Circle()
        .stroke(style: .init(lineWidth: 50))
        .fill(AngularGradient(
          gradient: Gradient(colors: [
            .red, .orange, .yellow, .blue, .green, .purple, .red
          ]),
          center: .center)
        )
        .padding(40)
        .rotationEffect(.degrees(shouldRotate ? 720 : 0))
        .animation(.easeInOut(duration: 4))
      Button(action: {
        self.shouldRotate.toggle()
      }) {
        Text("摇 滚")
      }
    }
  }
}

struct RockRoll_Previews: PreviewProvider {
  static var previews: some View {
    RockRoll()
  }
}
