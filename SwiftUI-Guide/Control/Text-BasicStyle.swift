//
//  Text-BasicStyle.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/30.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Text_BasicStyle: View {
  var body: some View {
    VStack {
      // Basic style
      Text("www.hdjc8.com").bold()
      Text("www.hdjc8.com").italic()
      Text("www.hdjc8.com").underline()
      Text("www.hdjc8.com").underline(true, color: .orange)
      Text("www.hdjc8.com").strikethrough()
      Text("www.hdjc8.com").strikethrough(true, color: .orange)
      Text("www.hdjc8.com").foregroundColor(Color.orange)
      Text("www.hdjc8.com")
        .baselineOffset(CGFloat(5.0))
        .background(Color.orange)
      Text("www.hdjc8.com")
        .background(Image("Picture"), alignment: .bottom)

      // Font
      VStack {
        Text("www.hdjc8.com").font(.footnote)
        Text("www.hdjc8.com").font(.system(size: 36))
        Text("www.hdjc8.com")
            .font(.system(.title, design: .monospaced))
        Text("www.hdjc8.com")
            .font(.custom("BradleyHandITCTT-Bold", size: 36))
        Text("www.hdjc8.com").fontWeight(Font.Weight.heavy)
        Text("www.hdjc8.com").fontWeight(Font.Weight.ultraLight)
      }
    }
  }
}

struct Text_BasicStyle_Previews: PreviewProvider {
  static var previews: some View {
    Text_BasicStyle()
  }
}
