//
//  DividerView.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/30.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct DividerView: View {
  var body: some View {
    VStack {
      VStack {
        Image(systemName: "clock")
        Divider()
        Text("\(Date())")
      }
      .padding()
      VStack {
        Image(systemName: "clock")
        Divider()
          .background(Color.purple)
          .scaleEffect(CGSize(width: 1, height: 10))
        Text("\(Date())")
      }
      .padding()
    }
  }
}

struct DividerView_Previews: PreviewProvider {
  static var previews: some View {
    DividerView()
  }
}
