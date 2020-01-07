//
//  Button-Basic.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/30.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Button_Basic: View {
  var body: some View {
    VStack {
      Button("First button") {
        print("---First button action.")
      }
      Button(action: {
        print("---Second button action.")
      }) {
        Text("Second button")
      }
      Button(action: {
        print("---Third button action.")
      }) {
        Image(systemName: "clock")
        Text("Third button")
      }
      .foregroundColor(Color.white)
      .background(Color.orange)
      // padding for button : the tap area is wrong
      Button(action: {
        print("---padding for button.")
      }) {
        Text("Default padding")
      }
      .padding()
      .background(Color.yellow)
      // padding for label : the tap area is correct!
      Button(action: {
        print("---padding for label.")
      }) {
        Text("Default padding")
          .padding()
          .background(Color.yellow)
      }
      Button(action: {
        print("---Button with image.")
      }) {
        HStack {
          Image(systemName: "star")
          Text("Button with image")
        }
        .padding()
        .background(Color.yellow)
      }
      Button(action: {
        print("---modifier button")
      }) {
        Text("modifier button")
          .modifier(MyButtonStyle())
      }
    }
  }
}

struct MyButtonStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding()
      .background(Color.orange)
      .cornerRadius(5)
  }
}

struct Button_Basic_Previews: PreviewProvider {
  static var previews: some View {
    Button_Basic()
  }
}
