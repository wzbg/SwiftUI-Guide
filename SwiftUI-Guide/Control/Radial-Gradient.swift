//
//  Radial-Gradient.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Radial_Gradient: View {
  var body: some View {
    Text("SwifUI Gradient")
      .font(.system(size: 36))
      .foregroundColor(Color.white)
      .padding()
      .background(
        RadialGradient(
          gradient: Gradient(colors: [.orange, .red, .purple]),
          center: .init(x: 0.5, y: 0.5),
          startRadius: CGFloat(10),
          endRadius: CGFloat(120)
        )
      )
  }
}

struct Radial_Gradient_Previews: PreviewProvider {
  static var previews: some View {
    Radial_Gradient()
  }
}
