//
//  ScrollView-VerticalAndHorizontal.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct ScrollView_Vertical_Horizontal: View {
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .leading, spacing: 20) {
        Text("Overview")
          .font(.system(size: 48))
          .padding(10)
        Text("With the power of Xcode, the ease of Swift, and the revolutionary features of cutting-edge Apple technologies, you have the freedom to create your most innovative apps ever.\nSwiftUI provides views, controls, and layout structures for declaring your app's user interface. The framework provides event handlers for delivering taps, gestures, and other types of input to your app, and tools to manage the flow of data from your app's models down to the views and controls that users will see and interact with.")
          .lineLimit(nil)
          .frame(width: 300, height: 240, alignment: .topLeading)
          .padding(10)
        ScrollView(.horizontal, showsIndicators: true) {
          HStack(alignment: .center, spacing: 20) {
            Image("iPhone")
              .resizable()
              .frame(width: 300, height: 556, alignment: .center)
            Image("iPhoneSerial")
              .resizable()
              .frame(width: 823, height: 556, alignment: .center)
            Image("iPhone")
              .resizable()
              .frame(width: 300, height: 556, alignment: .center)
          }
        }
      }
    }
    .background(/*@START_MENU_TOKEN@*/Color.orange/*@END_MENU_TOKEN@*/)
    .padding(10)
    .navigationBarTitle("ScrollView")
  }
}

struct ScrollView_Vertical_Horizontal_Previews: PreviewProvider {
  static var previews: some View {
    ScrollView_Vertical_Horizontal()
  }
}
