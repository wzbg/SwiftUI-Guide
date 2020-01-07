//
//  Opacity-Linear.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Opacity_Linear: View {
  @State var factor: CGFloat = 1
  @State var alpha: Double = 1
  
  var body: some View {
    Image("logo")
      .scaleEffect(factor)
      .opacity(alpha)
      .onTapGesture {
        withAnimation(.linear(duration: 1)) {
          self.factor += 0.1
          self.alpha -= 0.1
        }
      }
  }
}

struct Opacity_Linear_Previews: PreviewProvider {
  static var previews: some View {
    Opacity_Linear()
  }
}
