//
//  SpeadAndDelay.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct SpeadAndDelay: View {
  @State var factor: CGFloat = 1
  
  var animation: Animation {
    Animation.linear(duration: 1)
      .speed(5)
      .delay(2)
  }
  
  var body: some View {
    VStack {
      Spacer()
      Image("logo")
        .scaleEffect(factor)
        .animation(animation)
      Spacer()
      HStack {
        Button(action: {
          self.factor += 0.2
        }) {
          Text("放大")
        }.padding()
        Button(action: {
          self.factor -= 0.2
        }) {
          Text("缩小")
        }.padding()
      }
    }
  }
}

struct SpeadAndDelay_Previews: PreviewProvider {
  static var previews: some View {
    SpeadAndDelay()
  }
}
