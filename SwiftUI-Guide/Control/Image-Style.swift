//
//  Image-Style.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/30.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Image_Style: View {
  var body: some View {
    ScrollView {
      Image("girlPicture")
        .border(Color.orange)
      Image("girlPicture")
        .border(Color.orange, width: 10)
      Image("girlPicture")
        .opacity(0.5)
      Image("girlPicture")
        .shadow(radius: 10)
      Image("girlPicture")
        .shadow(color: .purple, radius: 20, x: 20, y: 20)
    }
  }
}

struct Image_Style_Previews: PreviewProvider {
  static var previews: some View {
    Image_Style()
  }
}
