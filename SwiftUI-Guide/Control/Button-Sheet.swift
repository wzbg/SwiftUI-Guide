//
//  Button-Sheet.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/30.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Button_Sheet: View {
  @State var isPresented = false
  
  var body: some View {
    VStack{
      Button("Show modal") {
        self.isPresented = true
      }.sheet(isPresented: $isPresented, content: {
        MyDetailView(message: "Modal window")
      })
    }
  }
}

struct MyDetailView: View {
  let message: String

  var body: some View {
    VStack {
      Text(message)
        .font(.largeTitle)
    }
  }
}

struct Button_Sheet_Previews: PreviewProvider {
  static var previews: some View {
    Button_Sheet()
  }
}
