//
//  Shape-Rectangle.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Shape_Rectangle: View {
  var body: some View {
    VStack {
      Rectangle()
      Rectangle()
        .fill(/*@START_MENU_TOKEN@*/Color.orange/*@END_MENU_TOKEN@*/)
        .frame(width: 200, height: 200)
      ZStack {
        Rectangle().fill(Color.purple)
        Rectangle().fill(Color.yellow).scaleEffect(0.8)
        Rectangle().fill(Color.orange).scaleEffect(0.6)
      }.frame(width: 300, height: 200)
      RoundedRectangle(cornerRadius: 120)
      RoundedRectangle(cornerSize: CGSize(width: 100, height: 40))
        .frame(width: 300, height: 200)
      RoundedRectangle(cornerRadius: 100, style: .continuous)
    }
  }
}

struct Shape_Rectangle_Previews: PreviewProvider {
  static var previews: some View {
    Shape_Rectangle()
  }
}
