//
//  Image-Blend.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/30.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Image_Blend: View {
  var body: some View {
    VStack {
      Image("girlPicture")
        .blendMode(.difference)
      ZStack{
        Image("texture")
        Image("girlPicture")
          .blendMode(.multiply)
      }
    }
    .padding()
  }
}

struct Image_Blend_Previews: PreviewProvider {
  static var previews: some View {
    Image_Blend()
  }
}
