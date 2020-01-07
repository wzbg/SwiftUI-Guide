//
//  ViewAsProperties.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/7.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct ViewAsProperties: View {
  var body: some View {
    HStack(alignment: .bottom, spacing: 40) {
      Image(systemName: "book.fill")
      Text("Interactive Tutorials")
      Spacer()
      Image(systemName: "icloud.and.arrow.down")
    }.padding()
  }
}

struct ViewAsProperties_Previews: PreviewProvider {
  static var previews: some View {
    ViewAsProperties()
  }
}
