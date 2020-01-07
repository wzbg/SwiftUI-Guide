//
//  Show_Modal.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/7.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct Show_Modal: View {
  @State var isPresented = false
  
  var modalView: some View {
    Text("The Modal View")
      .font(.system(size: 48))
      .bold()
  }
  
  var body: some View {
    Button(action: {
      self.isPresented = true
    }) {
      Text("Show Modal View")
    }.sheet(isPresented: $isPresented) {
      self.modalView
    }
  }
}

struct Show_Modal_Previews: PreviewProvider {
  static var previews: some View {
    Show_Modal()
  }
}
