//
//  NavigationLinkAndGoBack.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct NavigationLink_GoBack: View {
  @State private var isPresented = false
  
  var body: some View {
    NavigationView {
      NavigationLink(
        destination: DetailView(preView: self),
        isActive: $isPresented
      ) {
        VStack {
          Image("logo")
            .renderingMode(.original)
          Text("Next Page >")
        }
      }
    }
  }
  
  func toggleValue() {
    self.isPresented.toggle()
  }
}

struct DetailView: View {
    var preView : NavigationLink_GoBack
    
    var body: some View {
      Text("< Go back").onTapGesture {
        self.preView.toggleValue()
      }
      .navigationBarHidden(true)
      .navigationBarTitle("")
    }
}

struct NavigationLink_GoBack_Previews: PreviewProvider {
  static var previews: some View {
    NavigationLink_GoBack()
  }
}
