//
//  Image-Basic.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/30.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Image_Basic: View {
  var body: some View {
    VStack {
      Image("girlPicture")
      Image(systemName: "arkit")
        .foregroundColor(.orange)
        .font(.system(size: 48))
      Image("girlPicture")
        .resizable()
        .aspectRatio(contentMode: .fit)
    }
    .padding()
  }
}

struct Image_Basic_Previews: PreviewProvider {
  static var previews: some View {
    Image_Basic()
  }
}
