//
//  Text-FullScreen.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/30.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Text_FullScreen: View {
  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
      .background(Color.orange)
      .font(.largeTitle)
      .edgesIgnoringSafeArea(.all)
  }
}

struct Text_FullScreen_Previews: PreviewProvider {
  static var previews: some View {
    Text_FullScreen()
  }
}
