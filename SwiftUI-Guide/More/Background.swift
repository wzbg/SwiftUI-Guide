//
//  Background.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/7.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct Background: View {
  var body: some View {
    VStack {
      Spacer()
      Text("SwiftUI Tutorials")
        .font(.largeTitle)
        .padding()
        .background(Color.orange)
      Spacer()
      Text("SwiftUI Tutorials")
        .font(.largeTitle)
        .padding()
        .background(Image("iPhoneSerial")
          .resizable())
      Spacer()
      Text("SwiftUI Tutorials")
        .font(.largeTitle)
        .padding()
        .background(Circle()
          .fill(Color.orange)
          .frame(width: 280, height: 280))
      Spacer()
    }
  }
}

struct Background_Previews: PreviewProvider {
  static var previews: some View {
    Background()
  }
}
