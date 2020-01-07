//
//  CombinedAnimation.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct CombinedAnimation: View {
  @State var radius: CGFloat = 0
  @State var brightness: Double = 0
  
  var body: some View {
    VStack {
      Spacer()
      Image("logo")
        .shadow(radius: radius)
        .brightness(brightness)
        .animation(.linear(duration: 2))
      Spacer()
      HStack {
        Button(action: {
          self.radius += 1
          self.brightness += 0.1
        }) {
          Text("加亮度阴影")
        }.padding()
        Button(action: {
          self.radius -= 1
          self.brightness -= 0.1
        }) {
          Text("减亮度阴影")
        }.padding()
      }
    }
  }
}

struct CombinedAnimation_Previews: PreviewProvider {
  static var previews: some View {
    CombinedAnimation()
  }
}
