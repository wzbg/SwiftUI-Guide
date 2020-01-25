//
//  Rotation.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/25.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct Rotation: View {
  @State private var rotation = false
  
  var body: some View {
    VStack {
      Image("logo")
        .background(LinearGradient(
          gradient: Gradient(colors: [.blue, .red, .green]),
          startPoint: .topTrailing,
          endPoint: .bottomLeading
        ))
        .hueRotation(.degrees(rotation ? 720 : 0))
        .animation(.linear(duration: 3))
      Divider()
        .fixedSize()
      Button(action: {
        self.rotation.toggle()
      }) {
        Text("启动动画")
      }
    }
  }
}

struct Rotation_Previews: PreviewProvider {
  static var previews: some View {
    Rotation()
  }
}
