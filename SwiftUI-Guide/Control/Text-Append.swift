//
//  Text-Append.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/30.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Text_Append: View {
  var body: some View {
    Text("Interactive ")
      .foregroundColor(.yellow)
      .fontWeight(.heavy)
    + Text("tutorials ")
      .foregroundColor(.orange)
      .strikethrough()
    + Text("for ")
      .foregroundColor(.red)
      .italic()
    + Text("SwiftUI")
      .foregroundColor(.purple)
      .underline()
  }
}

struct Text_Append_Previews: PreviewProvider {
  static var previews: some View {
    Text_Append()
  }
}
