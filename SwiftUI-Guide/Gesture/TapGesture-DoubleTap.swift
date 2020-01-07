//
//  TapGesture+DoubleTap.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct TapGesture_DoubleTap: View {
  @State var isPressed = false
  
  var body: some View {
    Circle()
      .fill(/*@START_MENU_TOKEN@*/Color.orange/*@END_MENU_TOKEN@*/)
      .frame(width: 240, height: 240)
      .scaleEffect(isPressed ? 1.4 : 1)
      .animation(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
      .gesture(TapGesture(count: 2).onEnded({
        self.isPressed.toggle()
        print("Double tap.")
      }))
  }
}

struct TapGesture_DoubleTap_Previews: PreviewProvider {
  static var previews: some View {
    TapGesture_DoubleTap()
  }
}
