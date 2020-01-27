//
//  ProductList.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/27.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct LightApp: View {
  @State var isAnimating = false
  
  var body: some View {
    ZStack {
      Rectangle()
        .foregroundColor(Color(red: 250/255, green: 250/255, blue: 250/255))
        .edgesIgnoringSafeArea(.all)
      VStack(spacing: 20) {
        TopPartView()
        CategoriesView()
        Button(action: {
        }) {
          ZStack {
            RoundedRectangle(cornerRadius: 25)
              .frame(width: UIScreen.main.bounds.width / 2, height: 50)
              .foregroundColor(Color(red: 186/255, green: 158/255, blue: 183/255))
            HStack {
              Image(systemName: "arkit")
              Text("AR VIEW")
            }.foregroundColor(.white)
          }
        }.modifier(LightAnimationStyle(isAnimating: $isAnimating, offsetY: 120, delay: 0.9))
      }
    }.onAppear() {
      self.isAnimating.toggle()
    }
  }
}

struct LightApp_Previews: PreviewProvider {
  static var previews: some View {
    LightApp()
  }
}

struct TopPartView: View {
  @State var isAnimating = false
  
  var body: some View {
    ZStack {
      Text("LightApp")
        .bold()
        .font(.system(size: 24))
        .modifier(LightAnimationStyle(isAnimating: $isAnimating, offsetY: -100, delay: 0.1))
      HStack {
        Image(systemName: "list.bullet.indent")
          .foregroundColor(Color(red: 186/255, green: 158/255, blue: 183/255))
          .scaleEffect(1.2)
          .modifier(LightAnimationStyle(isAnimating: $isAnimating, offsetX: -100, delay: 0.1))
        Spacer()
        ZStack {
          RoundedRectangle(cornerRadius: 25)
            .frame(width: 100, height: 50)
            .foregroundColor(.white)
            .shadow(
              color: Color(red: 186/255, green: 158/255, blue: 183/255)
                .opacity(0.4),
              radius: 10,
              x: 0,
              y: 0
          )
          Image(systemName: "cart")
            .offset(x: -10, y: 0)
        }.modifier(LightAnimationStyle(isAnimating: $isAnimating, offsetX: 150, delay: 0.1))
      }
    }.padding(.horizontal, 30)
    .onAppear() {
      self.isAnimating.toggle()
    }
  }
}

struct ProductRowView: View {
  private let boxSize = UIScreen.main.bounds.width / 2 - 30 - 20 / 2
  private let bgColor = Color(red: 250/255, green: 250/255, blue: 250/255)
  var firstImage = "Picture1"
  var secondImage = "Picture2"
  
  var body: some View {
    HStack {
      ZStack {
        RoundedRectangle(cornerRadius: 10)
          .fill(bgColor)
          .frame(width: boxSize, height: boxSize)
          .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 0)
        Image(firstImage)
          .resizable()
          .frame(width: boxSize, height: boxSize)
      }
      Spacer().frame(width: 20)
      ZStack {
        RoundedRectangle(cornerRadius: 10)
          .fill(bgColor)
          .frame(width: boxSize, height: boxSize)
          .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 0)
        Image(secondImage)
          .resizable()
          .frame(width: boxSize, height: boxSize)
      }
    }
  }
}

struct CategoriesView: View {
  @State var isAnimating = false
  
  var body: some View {
    VStack {
      ZStack {
        Rectangle()
          .frame(width: UIScreen.main.bounds.width - 60, height: 1)
          .foregroundColor(Color.gray.opacity(0.5))
          .modifier(LightAnimationStyle(isAnimating: $isAnimating, opacity: 0, delay: 0.3))
        Text("Categories")
          .padding(.horizontal, 20)
          .padding(.bottom, 10)
          .background(Color(red: 250/255, green: 250/255, blue: 250/255))
          .modifier(LightAnimationStyle(isAnimating: $isAnimating, opacity: 0, delay: 0.5))
      }
      ScrollView(.vertical, showsIndicators: false) {
        ForEach(0 ..< 6, id: \.self) { item in
          ProductRowView()
        }
      }.modifier(LightAnimationStyle(isAnimating: $isAnimating, scale: 0, delay: 0.7))
    }.onAppear() {
      self.isAnimating.toggle()
    }
  }
}

struct LightAnimationStyle: ViewModifier {
  @Binding var isAnimating: Bool
  var offsetX: CGFloat = 0
  var offsetY: CGFloat = 0
  var scale: CGFloat = 1
  var opacity = 1.0
  var delay = 0.0
  
  func body(content: Content) -> some View {
    content
      .offset(x: isAnimating ? 0 : offsetX, y: isAnimating ? 0 : offsetY)
      .scaleEffect(isAnimating ? 1 : scale)
      .opacity(isAnimating ? 1 : opacity)
      .animation(Animation.spring().delay(delay))
  }
}
