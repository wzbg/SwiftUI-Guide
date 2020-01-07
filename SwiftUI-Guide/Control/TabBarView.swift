//
//  TabBarView.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
  var body: some View {
    TabView {
      Text("The home page.")
        .font(.system(size: 36))
        .tabItem({
          Image(systemName: "house")
          Text("Home")
        }).tag(0)
      Text("The settings page")
        .font(.system(size: 36))
        .tabItem({
          Image(systemName: "gear")
          Text("Settings")
        }).tag(1)
    }
  }
}

struct TabBarView_Previews: PreviewProvider {
  static var previews: some View {
    TabBarView()
  }
}
