//
//  NavigationBar-Title.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/7.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct NavigationBar_Title: View {
  var body: some View {
    NavigationView {
      Text("SwiftUI's NavigationView")
        .navigationBarTitle(Text("SwiftUI"), displayMode: .inline)
    }
  }
}

struct NavigationBar_Title_Previews: PreviewProvider {
  static var previews: some View {
      NavigationBar_Title()
  }
}
