//
//  Group-Layout.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct Group_Layout: View {
  var body: some View {
    Group {
      Text("Apple")
      Text("Banana")
      Text("Orange")
      Text("Watermelon")
      Text("Grape")
      Text("Papaya")
      Text("Pear")
    }
    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    .foregroundColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/)
    .padding()
  }
}

struct Group_Layout_Previews: PreviewProvider {
  static var previews: some View {
    Group_Layout()
  }
}
