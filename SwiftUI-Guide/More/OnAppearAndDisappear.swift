//
//  OnAppearAndDisappear.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/7.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct DetailView4: View {
  var body: some View {
    Text("Detail")
      .onAppear {
        print("DetailView appeared!")
      }
      .onDisappear {
        print("DetailView disappeared!")
      }
  }
}

struct OnAppearAndDisappear: View {
  @State private var isPresented = false
  
  var body: some View {
    Text("Show Detail > ")
      .sheet(isPresented: $isPresented) {
        DetailView4()
      }
      .onTapGesture {
        self.isPresented = true
      }
      .onAppear {
        print("ContentView appeared!")
      }
      .onDisappear {
        print("ContentView disappeared!")
      }
  }
}

struct OnAppearAndDisappear_Previews: PreviewProvider {
  static var previews: some View {
    OnAppearAndDisappear()
  }
}
