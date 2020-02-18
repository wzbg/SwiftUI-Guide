//
//  ContentView.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/30.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    PageView([
      Rectangle().foregroundColor(.gray),
      Rectangle().foregroundColor(.red),
      Rectangle().foregroundColor(.green),
      Rectangle().foregroundColor(.blue),
      Rectangle().foregroundColor(.orange),
      Rectangle().foregroundColor(.yellow),
      Rectangle().foregroundColor(.pink),
      Rectangle().foregroundColor(.purple)
    ])
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
