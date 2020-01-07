//
//  SpacerView.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/30.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct SpacerView: View {
  var body: some View {
    VStack {
      HStack {
        Image(systemName: "clock")
        Spacer()
      }
      .padding()
      HStack {
        Image(systemName: "clock")
        Spacer()
        Text("\(Date())")
      }
      .padding()
      HStack {
        Image(systemName: "clock")
        Spacer(minLength: 50)
        Text("\(Date())")
      }
      .padding()
    }
  }
}

struct SpacerView_Previews: PreviewProvider {
  static var previews: some View {
    SpacerView()
  }
}
