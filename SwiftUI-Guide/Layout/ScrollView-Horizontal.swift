//
//  ScrollView-Horizontal.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct ScrollView_Horizontal: View {
  var body: some View {
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
    .background(/*@START_MENU_TOKEN@*/Color.orange/*@END_MENU_TOKEN@*/)
    .padding(10)
    .navigationBarTitle("ScrollView")
  }
}

struct ScrollView_Horizontal_Previews: PreviewProvider {
  static var previews: some View {
    ScrollView_Horizontal()
  }
}
