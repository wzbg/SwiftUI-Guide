//
//  Preview-Device.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/7.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct Preview_Device: View {
  var body: some View {
    VStack {
      Text("Preview Device")
        .font(.system(size: 48))
      Text("Preview Device")
    }
  }
}

struct Preview_Device_Previews: PreviewProvider {
  static var previews: some View {
    Group {
     Preview_Device()
      .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
      .previewDisplayName("Device-8")
     Preview_Device()
      .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
      .previewDisplayName("Device-XS Max")
    }
  }
}
