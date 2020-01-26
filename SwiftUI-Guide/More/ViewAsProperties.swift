//
//  ViewAsProperties.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/7.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct ViewAsProperties: View {
  let icon = Image(systemName: "book.fill")
  let title = Text("Interactive Tutorials")
  let flag = Image(systemName: "icloud.and.arrow.down")
  
  var body: some View {
    HStack(alignment: .bottom, spacing: 40) {
      icon
      title
      Spacer()
      flag
    }.padding()
  }
}

struct ViewAsProperties_Previews: PreviewProvider {
  static var previews: some View {
    ViewAsProperties()
  }
}
