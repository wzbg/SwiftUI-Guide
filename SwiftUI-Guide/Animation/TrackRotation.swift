//
//  TrackRotation.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/25.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct TrackRotation: View {
  @State private var isAnimation = false
  
  var body: some View {
    ZStack {
      Capsule()
        .stroke(Color.orange, style: StrokeStyle(
          lineWidth: 10,
          lineCap: .butt,
          lineJoin: .bevel,
          miterLimit: 10,
          dash: [20, 11],
          dashPhase: isAnimation ? 200 : 0)
        )
        .frame(width: 300, height: 100)
        .animation(.easeInOut(duration: 3))
      Button(action: {
        self.isAnimation.toggle()
      }) {
        Text("履 带")
      }
    }
  }
}

struct TrackRotation_Previews: PreviewProvider {
  static var previews: some View {
    TrackRotation()
  }
}
