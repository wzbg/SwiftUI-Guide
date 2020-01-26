//
//  BindingView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/26.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct BindingView: View {
  @State private var isPresented = false
  
  var body: some View {
    PopView(show: $isPresented)
      .sheet(isPresented: $isPresented) {
        Button(action: {
          self.isPresented.toggle()
        }) {
          Text("Dismiss")
            .font(.largeTitle)
        }
      }
  }
}

struct PopView: View {
  @Binding var show: Bool
  
  var body: some View {
    Button(action: {
      self.show.toggle()
    }) {
      Image(systemName: "person.crop.circle")
        .font(.system(size: 32))
        .frame(width: 64, height: 64)
        .foregroundColor(.black)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: .orange, radius: 10, x: 0, y: 10)
    }
  }
}

struct BindingView_Previews: PreviewProvider {
  static var previews: some View {
    BindingView()
  }
}
