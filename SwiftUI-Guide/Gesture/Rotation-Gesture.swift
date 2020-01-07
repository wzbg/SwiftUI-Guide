//
//  Rotation+Gesture.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct Rotation_Gesture: View {
  @State var angle = 0.0
  
  var body: some View {
    Image("logo")
      .rotationEffect(.init(degrees: angle))
      .gesture(
        RotationGesture(minimumAngleDelta: .init(degrees: 20))
          .onChanged({
            self.angle = $0.animatableData
          })
          .onEnded({
            print($0)
          })
      )
  }
}

struct Rotation_Gesture_Previews: PreviewProvider {
  static var previews: some View {
    Rotation_Gesture()
  }
}
