//
//  SequenceGesture.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/25.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct Sequence_Gesture: View {
  @State var offset: CGSize = .zero
  @GestureState var isLongPressed = false
  
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
        .scaleEffect(isLongPressed ? 1.4 : 1)
        .animation(.spring())
        .gesture(SequenceGesture(
          LongPressGesture()
            .updating($isLongPressed) { value, state, transcation in
              print(value, state, transcation)
              state = value
            }
            .onEnded {
              print($0)
            },
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
        ).onEnded {
          print($0)
        })
    }
  }
}

struct Sequence_Gesture_Previews: PreviewProvider {
  static var previews: some View {
    Sequence_Gesture()
  }
}
