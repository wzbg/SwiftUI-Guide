//
//  AnyView.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/7.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct Any_View: View {
  private var randomBool = Bool.random()
  
  var body: AnyView {
    if randomBool {
      return AnyView(Image(systemName: "star.fill").font(.system(size: 72)))
    } else {
      return AnyView(Text("Sorry, you miss the gift.").font(.system(size: 32)))
    }
  }
}

struct Any_View_Previews: PreviewProvider {
  static var previews: some View {
    Any_View()
  }
}
