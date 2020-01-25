//
//  MobileUnlock.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/25.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct SlideUnlock: View {
  @State private var hueShift = false
  
  var body: some View {
    ZStack {
      Text("滑动解锁")
        .font(.largeTitle)
        .foregroundColor(.purple)
        .brightness(-0.2)
        .hueRotation(.degrees(hueShift ? 0 : 720))
        .animation(.easeInOut(duration: 4))
        .onTapGesture {
          self.hueShift.toggle()
        }
      Rectangle()
        .frame(maxWidth: 220, maxHeight: 40)
        .foregroundColor(.white)
        .opacity(0.4)
        .rotationEffect(.degrees(0), anchor: .trailing)
        .scaleEffect(x: hueShift ? 0 : 1, y: 1, anchor: .trailing)
        .animation(.easeInOut(duration: 4))
    }
  }
}

struct SlideUnlock_Previews: PreviewProvider {
  static var previews: some View {
    SlideUnlock()
  }
}
