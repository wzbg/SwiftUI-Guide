//
//  Text-Paragraph.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/30.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Text_Paragraph: View {
  var body: some View {
    VStack {
      Text("www.hdjc8.com")
      Text("www.hdjc8.com").tracking(10)
      Text("www.hdjc8.com").kerning(10)
      Text("www.hdjc8.com").blur(radius: 1)
      Text("SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.").lineSpacing(20).lineLimit(2)
      Text("www.hdjc8.com").offset(x: 40, y: 0)
      Text("www.hdjc8.com")
        .frame(width: 200, height: 80, alignment: .bottomTrailing)
        .background(Color.orange)

      VStack {
        Text("www.hdjc8.com2")
          .position(x: 50, y: 50)
          .frame(width: 300, height: 100, alignment: .bottomTrailing)
          .background(Color.orange)
        Text("Interactive\ntutorials\nfor\nXcode!")
          .multilineTextAlignment(.center)
          .lineLimit(4)
        Text("Hello\nInteractive Tutorials!")
          .multilineTextAlignment(.leading)
      }
    }
  }
}

struct Text_Paragraph_Previews: PreviewProvider {
  static var previews: some View {
    Text_Paragraph()
  }
}
