//
//  Presentation-Modal.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/26.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct Presentation_Modal: View {
  @State private var isPresented = false
  
  var body: some View {
    Button("Show Modal View") {
      self.isPresented.toggle()
    }.sheet(isPresented: $isPresented) {
      ModelView()
    }
  }
}

struct ModelView: View {
  @Environment(\.presentationMode) var presentationMode
  var body: some View {
    VStack {
      Text("Modal")
      Button("Close") {
        self.presentationMode.wrappedValue.dismiss()
      }
    }
  }
}

struct Presentation_Modal_Previews: PreviewProvider {
  static var previews: some View {
    Presentation_Modal()
  }
}
