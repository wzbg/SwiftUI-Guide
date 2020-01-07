//
//  Drag+Gesture.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct Drag_Gesture: View {
  @State var offset: CGSize = .zero
  
  var body: some View {
    VStack {
      Circle()
        .fill(Color.blue)
        .opacity(0.1)
        .frame(width: 200, height: 200)
        .offset(CGSize(width: 0, height: -50))
      Circle()
        .fill(Color.orange)
        .frame(width: 200, height: 200)
        .offset(offset)
        .animation(.spring())
        .gesture(
          DragGesture()
            .onChanged({
              print($0.startLocation, $0.location, $0.translation)
              self.offset = $0.translation
            })
            .onEnded({
              if abs($0.translation.width) >= 40 ||
                abs($0.translation.height + 260) >= 40 {
                self.offset = .zero
              } else {
                self.offset = CGSize(width: 0, height: -260)
              }
            })
        )
    }
  }
}

struct Drag_Gesture_Previews: PreviewProvider {
  static var previews: some View {
    Drag_Gesture()
  }
}
