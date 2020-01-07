//
//  LongPressGesture.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct LongPress_Gesture: View {
  @GestureState var isLongPressed = false
  
  var body: some View {
    Circle()
      .fill(/*@START_MENU_TOKEN@*/Color.orange/*@END_MENU_TOKEN@*/)
      .frame(width: 240, height: 240)
      .scaleEffect(isLongPressed ? 1.4 : 1)
      .animation(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
      .gesture(
        LongPressGesture()
          .updating($isLongPressed) { value, state, transcation in
            print(value, state, transcation)
            state = value
          }
          .onEnded {
            print($0)
          }
      )
  }
}

struct LongPress_Gesture_Previews: PreviewProvider {
  static var previews: some View {
    LongPress_Gesture()
  }
}
