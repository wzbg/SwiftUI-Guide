//
//  TeachApp.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/27.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct TeachApp: View {
  @State var isAnimating = false
  
  var body: some View {
    VStack(alignment: .leading) {
      Image(systemName: "list.bullet.indent")
        .font(.system(size: 24))
        .padding(.top, 30)
        .modifier(AnimationStyle(isAnimating: $isAnimating, delay: 0.2))
      Spacer()
      Text("A")
        .bold()
        .underline()
        .font(.system(size: 48))
        .modifier(AnimationStyle(isAnimating: $isAnimating, delay: 0.4))
      Spacer()
      Text("Welcome to\nthe new\nSwiftUI-Tutorials")
        .font(.system(size: 44))
        .foregroundColor(.gray)
        .fontWeight(.light)
        .multilineTextAlignment(.leading)
        .scaleEffect(x: 1, y: 0.9, anchor: .center)
        .modifier(AnimationStyle(isAnimating: $isAnimating, delay: 0.6))
      Text("New level of features\nwith new app")
        .font(.system(size: 24))
        .foregroundColor(.gray)
        .fontWeight(.thin)
        .lineSpacing(5)
        .padding(.top, 10)
        .modifier(AnimationStyle(isAnimating: $isAnimating, delay: 0.8))
      Spacer()
      VStack {
        HStack(spacing: 10) {
          Button(action: {
          }) {
            Text("Log In")
              .bold()
              .modifier(TeachButtonStyle(
                frameWidth: UIScreen.main.bounds.width - 140, backgroundColor: .black
              ))
          }.padding(.trailing, 10)
          .modifier(AnimationStyle(isAnimating: $isAnimating, delay: 1))
          Button(action: {
          }) {
            Image(systemName: "faceid")
              .modifier(TeachButtonStyle(frameWidth: 60, backgroundColor: .black))
          }
          .modifier(AnimationStyle(isAnimating: $isAnimating, delay: 1.2))
        }
        Button(action: {
        }) {
          Text("Become a partner")
            .bold()
            .modifier(TeachButtonStyle(
              frameWidth: UIScreen.main.bounds.width - 60, backgroundColor: .red
            ))
        }.padding(.top, 10)
        .modifier(AnimationStyle(isAnimating: $isAnimating, delay: 1.4))
      }
      Spacer()
    }.onAppear {
      self.isAnimating.toggle()
    }
  }
}

struct TeachButtonStyle: ViewModifier {
  var frameWidth: CGFloat
  var backgroundColor: Color
  
  func body(content: Content) -> some View {
    content
      .frame(width: frameWidth, height: 60)
      .background(backgroundColor)
      .cornerRadius(10)
      .foregroundColor(.white)
      .font(.system(size: 20))
  }
}

struct AnimationStyle: ViewModifier {
  @Binding var isAnimating: Bool
  var delay = 0.0
  
  func body(content: Content) -> some View {
    content
      .offset(x: isAnimating ? 0 : UIScreen.main.bounds.width * -1, y: 0)
      .animation(Animation.interpolatingSpring(stiffness: 100, damping: 10).delay(delay))
  }
}

struct TeachApp_Previews: PreviewProvider {
  static var previews: some View {
    TeachApp()
  }
}
