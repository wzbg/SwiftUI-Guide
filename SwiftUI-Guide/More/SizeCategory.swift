//
//  SizeCategory.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/7.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct SizeCategory: View {
  var body: some View {
    VStack {
      Text("Dynamic Type sizes")
        .font(.system(size: 36))
      Text("Dynamic Type sizes")
    }
  }
}

struct SizeCategory_Previews: PreviewProvider {
  static var previews: some View {
    VStack{
        Spacer()
        SizeCategory()
          .environment(\.sizeCategory, .extraSmall)
        Spacer()
        SizeCategory()
        Spacer()
        SizeCategory()
          .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        Spacer()
    }
  }
}
