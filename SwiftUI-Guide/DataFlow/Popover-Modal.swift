//
//  Popover-Modal.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/26.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct Popover_Modal: View {
  @State private var isPresented = false
  
  var modalView: some View {
    Text("The Modal View")
      .font(.system(size: 48))
      .bold()
  }
  
  var body: some View {
    Button("Show Modal View") {
      self.isPresented.toggle()
    }.popover(isPresented: $isPresented) {
      self.modalView
    }
  }
}

struct Popover_Modal_Previews: PreviewProvider {
  static var previews: some View {
    Popover_Modal()
  }
}
