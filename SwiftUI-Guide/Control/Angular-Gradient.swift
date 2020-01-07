//
//  Angular-Gradient.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Angular_Gradient: View {
  var body: some View {
    VStack {
      Text("SwifUI Gradient")
        .font(.system(size: 36))
        .foregroundColor(Color.white)
        .padding()
        .background(
          AngularGradient(
            gradient: Gradient(colors: [.orange, .red, .purple]),
            center: UnitPoint(x: 0.5, y: 0.5),
            angle: .init(degrees: -45)
          )
        )
      Text("SwifUI Gradient")
        .font(.system(size: 36))
        .foregroundColor(Color.white)
        .padding()
        .background(
          AngularGradient(
            gradient: Gradient(colors: [.orange, .red, .purple]),
            center: .init(x: 0.5, y: 0.5),
            startAngle: .init(degrees: 0),
            endAngle: .init(degrees: 0)
          )
        )
    }
  }
}

struct Angular_Gradient_Previews: PreviewProvider {
  static var previews: some View {
    Angular_Gradient()
  }
}
