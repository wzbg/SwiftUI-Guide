//
//  Image-Mask.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/30.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Image_Mask: View {
  var body: some View {
    VStack {
      Image("girlPicture")
        .clipShape(Circle())
      Image("girlPicture")
        .mask(Circle())
      Image("texture")
        .resizable()
        .frame(width: 300, height: 300)
        .mask(
          Text("SWIFT UI!")
            .font(Font.system(size: 64).bold()
        )
      )
    }
  }
}

struct Image_Mask_Previews: PreviewProvider {
  static var previews: some View {
    Image_Mask()
  }
}
