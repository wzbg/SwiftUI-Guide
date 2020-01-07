//
//  ColorScheme-LightAndDark.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/7.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct ColorScheme_LightAndDark: View {
  var body: some View {
    VStack {
      Text("Dynamic Type sizes")
        .font(.system(size: 48))
        .foregroundColor(Color.secondary)
      Text("Dynamic Type sizes")
        .foregroundColor(Color.accentColor)
      Image(systemName: "star.fill")
        .foregroundColor(Color.secondary)
        .font(.system(size: 64))
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    .background(Color.primary)
    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
  }
}

struct ColorScheme_LightAndDark_Previews: PreviewProvider {
  static var previews: some View {
    HStack {
      ColorScheme_LightAndDark()
        .environment(\.colorScheme, .light)
      ColorScheme_LightAndDark()
        .environment(\.colorScheme, .dark)
    }
  }
}
