//
//  GameApp.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/27.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct GameApp: View {
  var body: some View {
    ZStack {
      Rectangle()
        .foregroundColor(Color(red: 48/255, green: 50/255, blue: 65/255))
        .edgesIgnoringSafeArea(.all)
      VStack(spacing: 20) {
        GameTitleView()
        Spacer()
        GameContentView()
        Spacer()
        GameBottomView()
      }.padding(40)
    }
  }
}

struct GameApp_Previews: PreviewProvider {
  static var previews: some View {
    GameApp()
  }
}

struct GameAnimationStyle: ViewModifier {
  @Binding var isAnimating: Bool
  var delay = 0.0
  
  func body(content: Content) -> some View {
    content
      .opacity(isAnimating ? 1 : 0)
      .animation(Animation.spring().delay(delay))
  }
}

struct GameTitleView: View {
  @State var isAnimating = false
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text("http://www.hdjc8.com")
          .foregroundColor(.gray)
          .font(.system(size: 12))
          .modifier(GameAnimationStyle(isAnimating: $isAnimating))
        Spacer()
      }
      HStack {
        Text("选择游戏")
          .foregroundColor(.white)
          .font(.system(size: 32))
          .modifier(GameAnimationStyle(isAnimating: $isAnimating, delay: 0.2))
        Spacer()
      }
    }.onAppear() {
      self.isAnimating.toggle()
    }
  }
}

struct GameContentView: View {
  @State var isAnimating = false
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 20)
        .frame(
          width: UIScreen.main.bounds.width - 80,
          height: UIScreen.main.bounds.width - 80
        )
        .foregroundColor(.yellow)
      VStack {
        Text("互动教程")
          .font(.system(size: 28))
        Image("logo")
        Text("不看视频不看书，就上互动教程网！")
          .font(.system(size: 13))
          .multilineTextAlignment(.center)
          .frame(width: UIScreen.main.bounds.width - 120)
      }.padding(20)
    }
    .scaleEffect(isAnimating ? 1: 0)
    .opacity(isAnimating ? 1 : 0)
    .animation(Animation.interpolatingSpring(stiffness: 100, damping: 10).delay(0.4))
    .onAppear() {
      self.isAnimating.toggle()
    }
  }
}

struct GameBottomView: View {
  @State var isAnimating = false
  
  var body: some View {
    VStack(spacing: 20) {
      Text("更新样式")
        .foregroundColor(.gray)
        .font(.system(size: 13))
        .modifier(GameAnimationStyle(isAnimating: $isAnimating, delay: 0.6))
      Button("更新") {}
        .frame(width: UIScreen.main.bounds.width - 80, height: 50)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(25)
        .font(.system(size: 24))
        .offset(x: isAnimating ? 0 : UIScreen.main.bounds.width * -1, y: 0)
        .animation(Animation.spring().delay(0.8))
      Button("下一个") {}
        .frame(width: UIScreen.main.bounds.width - 80, height: 50)
        .background(Color.orange)
        .foregroundColor(.white)
        .cornerRadius(25)
        .font(.system(size: 24))
        .offset(x: isAnimating ? 0 : UIScreen.main.bounds.width, y: 0)
        .animation(Animation.spring().delay(1))
    }.onAppear() {
      self.isAnimating.toggle()
    }
  }
}
