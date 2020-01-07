//
//  Text-Padding.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/30.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Text_Padding: View {
  var body: some View {
    VStack {
      Text("www.hdjc8.com")
        .background(Color.black)
        .foregroundColor(.white)
        .padding(20)
      Text("www.hdjc8.com")
        .padding()
        .background(Color.black)
        .foregroundColor(.white)
      Text("Swift User Interface")
        .font(.largeTitle)
        .foregroundColor(.black)
        .padding(15)
        .background(Color.yellow)
        .padding(15)
        .background(Color.orange)
        .padding(10)
        .background(Color.red)
    }
  }
}

struct Text_Padding_Previews: PreviewProvider {
  static var previews: some View {
    Text_Padding()
  }
}
