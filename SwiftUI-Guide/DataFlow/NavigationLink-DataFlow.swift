//
//  NavigationLink.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct NavigationLink_DataFlow: View {
  var body: some View {
    NavigationView {
      NavigationLink(destination: MyDetailView(message: "Detail Page #2")) {
        Text("Go detail Page #2 >")
      }.navigationBarTitle("Index Page #1")
    }
  }
}

struct NavigationLink_DataFlow_Previews: PreviewProvider {
  static var previews: some View {
    NavigationLink_DataFlow()
  }
}
