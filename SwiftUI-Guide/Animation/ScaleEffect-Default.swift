//
//  ScaleEffect-Default.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct ScaleEffect_Default: View {
  @State var factor: CGFloat = 1
  
  var body: some View {
    VStack {
      Spacer()
      Image("logo")
        .scaleEffect(factor)
        .animation(.default)
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

struct ScaleEffect_Default_Previews: PreviewProvider {
  static var previews: some View {
    ScaleEffect_Default()
  }
}
