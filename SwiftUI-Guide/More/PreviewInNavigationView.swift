//
//  PreviewInNavigationView.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/7.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct PreviewInNavigationView: View {
  var body: some View {
    VStack {
      Image("SwiftUI")
        .navigationBarTitle("About SwiftUI")
      Text("SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs. With a declarative Swift syntax that’s easy to read and natural to write, SwiftUI works seamlessly with new Xcode design tools to keep your code and design perfectly in sync. Automatic support for Dynamic Type, Dark Mode, localization, and accessibility means your first line of SwiftUI code is already the most powerful UI code you’ve ever written.")
        .padding()
    }
  }
}

struct PreviewInNavigationView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      PreviewInNavigationView()
    }
  }
}
