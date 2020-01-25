//
//  Focus.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/25.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct FocusAnimation: View {
  @State private var isAnimation = false
  
  var body: some View {
    VStack {
      Image("Picture1")
        .clipShape(
          Circle()
            .inset(by: isAnimation ? 120 : 0)
            .offset(x: isAnimation ? 30 : 0, y: isAnimation ? -100 : 0)
        )
        .animation(.easeOut(duration: 2))
      Button(action: {
        self.isAnimation.toggle()
      }) {
        Text("聚 焦")
      }
    }
  }
}

struct FocusAnimation_Previews: PreviewProvider {
  static var previews: some View {
    FocusAnimation()
  }
}
