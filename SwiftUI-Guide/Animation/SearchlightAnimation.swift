//
//  Searchlight.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/25.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct SearchlightAnimation: View {
  @State private var isAnimation = false
  
  var body: some View {
    ZStack {
      Image("Picture1")
        .blur(radius: 6)
        .brightness(0.4)
      Image("Picture1")
        .clipShape(
          Rectangle()
            .size(CGSize(width: 340, height: 100))
            .offset(x: 0, y: isAnimation ? 590 : -100)
        )
        .animation(.linear(duration: 2))
        .onTapGesture {
          self.isAnimation.toggle()
        }
    }
  }
}

struct SearchlightAnimation_Previews: PreviewProvider {
  static var previews: some View {
    SearchlightAnimation()
  }
}
