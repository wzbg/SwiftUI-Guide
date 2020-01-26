//
//  PresentationMode.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/26.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct Presentation_Mode: View {
  var body: some View {
    NavigationLink(destination: SecondPage()) {
      Text("次页")
        .font(.largeTitle)
    }
  }
}

struct SecondPage: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
  var body: some View {
    VStack {
      Spacer()
      Button("首页") {
        self.presentationMode.wrappedValue.dismiss()
      }
      Spacer()
      NavigationLink(destination: ThreePage()) {
        Text("尾页")
      }
      Spacer()
    }
  }
}

struct ThreePage: View {
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    Button("次页") {
      self.presentationMode.wrappedValue.dismiss()
    }
  }
}

struct Presentation_Mode_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      Presentation_Mode()
    }
  }
}
