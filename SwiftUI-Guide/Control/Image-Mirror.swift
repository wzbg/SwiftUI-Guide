//
//  Image-Mirror.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/21.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct Image_Mirror: View {
  var body: some View {
    ZStack {
      Image("Picture2")
        .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
        .rotationEffect(.degrees(180), anchor: .center)
    }
  }
}

struct Image_Mirror_Previews: PreviewProvider {
  static var previews: some View {
    Image_Mirror()
  }
}
