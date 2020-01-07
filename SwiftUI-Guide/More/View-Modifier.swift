//
//  ViewModifier.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/7.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct View_Modifier: View {
  var body: some View {
    VStack(alignment: .center, spacing: 40) {
      Image("avarta1").modifier(myImageStyle())
      Image("avarta2").modifier(myImageStyle())
      Image("avarta3-2").modifier(myImageStyle())
    }
    .padding()
  }
}

struct myImageStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .frame(width: 200, height: 200)
      .cornerRadius(100)
      .clipped()
      .saturation(0)
  }
}

struct View_Modifier_Previews: PreviewProvider {
  static var previews: some View {
    View_Modifier()
  }
}
