//
//  AsymmetricTransition.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct AsymmetricTransition: View {
  @State var showPicture = false
  
  var body: some View {
    VStack {
      Button(action: {
        withAnimation {
          self.showPicture.toggle()
        }
      }) {
        Text((showPicture ? "隐藏" : "显示") + "图片")
      }
      if showPicture {
        Image("logo")
//          .transition(.move(edge: .top))
//          .transition(.scale(scale: 0))
//          .transition(.slide)
//          .transition(.asymmetric(
//            insertion: .scale(scale: 0),
//            removal: .slide)
//          )
          .transition(
            AnyTransition.scale(scale: 0)
              .combined(with:.slide)
          )
      }
    }
  }
}

struct AsymmetricTransition_Previews: PreviewProvider {
  static var previews: some View {
    AsymmetricTransition()
  }
}
