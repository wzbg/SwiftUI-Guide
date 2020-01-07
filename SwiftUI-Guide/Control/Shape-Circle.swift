//
//  Shape-Circle.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Shape_Circle: View {
  var body: some View {
    VStack {
      Circle()
      Circle()
        .fill(/*@START_MENU_TOKEN@*/Color.orange/*@END_MENU_TOKEN@*/)
        .frame(width: 200, height: 200)
      ZStack {
        Circle().fill(Color.purple)
        Circle().fill(Color.yellow).scaleEffect(0.8)
        Circle().fill(Color.orange).scaleEffect(0.6)
      }
    }
  }
}

struct Shape_Circle_Previews: PreviewProvider {
  static var previews: some View {
    Shape_Circle()
  }
}
