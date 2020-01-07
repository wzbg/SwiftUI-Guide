//
//  Offset-EaseOut.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Offset_EaseOut: View {
  @State var offsetX: CGFloat = 0
  @State var offsetY: CGFloat = 0
  private let distance: CGFloat = 120
  
  var body: some View {
    VStack {
      Spacer()
      Image("logo")
        .offset(x: offsetX, y: offsetY)
        .animation(.easeOut(duration: 2))
      Spacer()
      VStack {
        Button(action: {
          self.offsetY -= self.distance
        }) {
          Text("向上")
        }.padding()
        HStack {
          Button(action: {
            self.offsetX -= self.distance
          }) {
            Text("向左")
          }.padding()
          Button(action: {
            self.offsetX += self.distance
          }) {
            Text("向右")
          }.padding()
        }
        Button(action: {
          self.offsetY += self.distance
        }) {
          Text("向下")
        }.padding()
      }
    }
  }
}

struct Offset_EaseOut_Previews: PreviewProvider {
  static var previews: some View {
    Offset_EaseOut()
  }
}
