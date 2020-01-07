//
//  Image-Processing.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/30.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Image_Processing: View {
  var body: some View {
    ScrollView {
      VStack {
        Image("girlPicture")
        Image("girlPicture")
          .blur(radius: CGFloat(2))
        Image("girlPicture")
          .blur(radius: CGFloat(2), opaque: true)
        Image("girlPicture")
          .brightness(0.2)
        Image("girlPicture")
          .colorInvert()
        Image("girlPicture")
          .colorMultiply(Color.yellow)
        Image("girlPicture")
          .contrast(1.5)
      }
      VStack {
        Image("girlPicture")
          .hueRotation(Angle.degrees(180))
        Image("girlPicture")
          .saturation(10)
        Image("girlPicture")
          .grayscale(5.5)
        Image("girlPicture")
          .luminanceToAlpha()
      }
    }
  }
}

struct Image_Processing_Previews: PreviewProvider {
  static var previews: some View {
    Image_Processing()
  }
}
