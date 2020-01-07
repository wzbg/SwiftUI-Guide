//
//  HStack-Layout.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct HStack_Layout: View {
  var body: some View {
    HStack(alignment: .bottom, spacing: 40){
      Image(systemName: "book.fill")
      Text("Interactive Tutorials")
      Spacer()
      Image(systemName: "icloud.and.arrow.down")
    }
    .padding()
  }
}

struct HStack_Layout_Previews: PreviewProvider {
  static var previews: some View {
    HStack_Layout()
  }
}
