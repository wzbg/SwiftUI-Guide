//
//  HueRotation.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/24.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct HueRotation: View {
  @State var angle: Double = 0
  @State var brightness: Double = 0
  
  var body: some View {
    VStack {
      Spacer()
      Image("logo")
        .hueRotation(.init(degrees: angle))
        .brightness(brightness)
        .animation(.linear(duration: 2))
      Spacer()
      HStack {
        Button(action: {
          self.angle += 180
          self.brightness += 0.1
        }) {
          Text("加亮度色相")
        }.padding()
        Button(action: {
          self.angle -= 180
          self.brightness -= 0.1
        }) {
          Text("减亮度色相")
        }.padding()
      }
    }
  }
}

struct HueRotation_Previews: PreviewProvider {
  static var previews: some View {
    HueRotation()
  }
}
