//
//  RotateFlower.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/25.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct RotateFlower: View {
  @State private var shouldRotate = false
  @State private var shouldScale = false
  
  var body: some View {
    SubCapsule()
      .scaleEffect(shouldScale ? 0.2 : 1)
      .rotationEffect(
        .degrees(shouldRotate ? 0 : 360),
        anchor: .center
      )
      .animation(.easeInOut(duration: 4))
      .onTapGesture {
        self.shouldRotate.toggle()
        self.shouldScale.toggle()
      }
  }
}

struct RotateFlower_Previews: PreviewProvider {
  static var previews: some View {
    RotateFlower()
  }
}
