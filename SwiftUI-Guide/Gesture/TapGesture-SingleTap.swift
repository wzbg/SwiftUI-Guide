//
//  TapGesture+Single Tap.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct TapGesture_SingleTap: View {
  @State var isPressed = false
  
  var body: some View {
    Circle()
      .fill(/*@START_MENU_TOKEN@*/Color.orange/*@END_MENU_TOKEN@*/)
      .frame(width: 240, height: 240)
      .scaleEffect(isPressed ? 1.4 : 1)
      .animation(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
      .gesture(/*@START_MENU_TOKEN@*/TapGesture()/*@END_MENU_TOKEN@*/.onEnded({
        self.isPressed.toggle()
        print("Single tap.")
      }))
  }
}

struct TapGesture_SingleTap_Previews: PreviewProvider {
  static var previews: some View {
    TapGesture_SingleTap()
  }
}
