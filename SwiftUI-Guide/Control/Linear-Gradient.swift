//
//  LinearGradien.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Linear_Gradient: View {
  var body: some View {
    Text("SwifUI Gradient")
      .font(.system(size: 36))
      .foregroundColor(Color.white)
      .padding()
      .background(
        LinearGradient(
          gradient: Gradient(colors: [.orange, .red, .purple]),
          startPoint: .topLeading,
          endPoint: .bottomTrailing
        )
      )
  }
}

struct Linear_Gradient_Previews: PreviewProvider {
  static var previews: some View {
    Linear_Gradient()
  }
}
