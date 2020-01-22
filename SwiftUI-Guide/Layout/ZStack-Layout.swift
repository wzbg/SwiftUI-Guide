//
//  ZStack-Layout.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct ZStack_Layout: View {
  var body: some View {
    ZStack(alignment: .center) {
      Image("beach").clipShape(Circle())
      Text("Sea beach")
        .font(.system(size: 48))
        .foregroundColor(.white)
      Text("Hawaii - USA")
        .font(.system(size: 14))
        .foregroundColor(.white)
        .offset(x: 0, y: 36)
    }
    .padding(10)
  }
}

struct ZStack_Layout_Previews: PreviewProvider {
  static var previews: some View {
    ZStack_Layout()
  }
}
