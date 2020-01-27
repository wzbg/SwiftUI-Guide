//
//  SlideMenu.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/27.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct SlideMenuView: View {
  @State private var isPresented = false
  
  var body: some View {
    ZStack {
      Button("Slide Menu") {
        self.isPresented.toggle()
      }
      SlideMenu(isPresented: $isPresented)
    }
  }
}

struct SlideMenuView_Previews: PreviewProvider {
  static var previews: some View {
    SlideMenuView()
  }
}

struct SlideMenu: View {
  @Binding var isPresented: Bool
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      MenuItem(icon: "shift", title: "Go Premium")
      MenuItem(icon: "person", title: "My Profile")
      MenuItem(icon: "folder", title: "My Favories")
      MenuItem(icon: "doc", title: "Documents")
      MenuItem(icon: "shift", title: "Sign out")
      Spacer()
    }
    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
    .padding(.top, 30)
    .padding(20)
    .background(Color.white)
    .cornerRadius(20)
    .padding(.trailing, 150)
    .shadow(radius: 20)
    .rotation3DEffect(.degrees(isPresented ? 0 : 90), axis: (x: 0, y: 10, z: 0))
    .offset(x: isPresented ? 0 : -UIScreen.main.bounds.width)
    .animation(.interpolatingSpring(stiffness: 100, damping: 10))
    .onTapGesture {
      self.isPresented.toggle()
    }
  }
}

struct MenuItem: View {
  var icon: String
  var title: String
  
  var body: some View {
    HStack {
      Image(systemName: icon)
        .imageScale(.large)
        .frame(width: 32, height: 32)
      Text(title)
        .font(.headline)
      Spacer()
    }
  }
}
