//
//  VStack-Layout.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct VStack_Layout: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 50) {
      Text("The fruit and the tree")
        .font(.largeTitle)
      Image("Apple")
      Text("An apple is a sweet, edible fruit produced by an apple tree Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus.")
        .font(.body)
        .lineLimit(nil)
        .frame(height: 200)
    }
    .padding()
  }
}

struct VStack_Layout_Previews: PreviewProvider {
  static var previews: some View {
    VStack_Layout()
  }
}
