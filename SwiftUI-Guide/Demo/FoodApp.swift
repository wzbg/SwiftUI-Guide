//
//  FoodApp.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/29.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct Hero {
  var imageName: String
  var title: String
  var subTitle: String
  var slogan: String
}

let heroes = [
  Hero(
    imageName: "太华",
    title: "伽罗-太华",
    subTitle: "立定，风起，衣袂猎猎。搭箭，拉弦，满弓如月。“我等的，就是此刻。”",
    slogan: "蒙面神射手"
  ),
  Hero(
    imageName: "玄嵩",
    title: "庄周-玄嵩",
    subTitle: "年轻的医者的声音很轻，像在问他，又像在自言自语。箭鸣震动耳鼓，让他分辨不清。",
    slogan: "骑鱼的神医"
  ),
  Hero(
    imageName: "幽恒",
    title: "甄姬-幽恒",
    subTitle: "魔魇一日不除，终会遍布大陆。到那时，我们又能逃往何方？",
    slogan: "一曲为苍生"
  ),
  Hero(
    imageName: "岱宗",
    title: "典韦-岱宗",
    subTitle: "巨斧划破长空，这一刻，他是剑、是盾、是守护浩然正气最后的屏障。",
    slogan: "巨斧伏群魔"
  ),
  Hero(
    imageName: "飞衡",
    title: "韩信-飞衡",
    subTitle: "飞衡最厌恶失败。他从不怀疑自己会成为那个万人之上的赢家。",
    slogan: "我绝不认输"
  ),
]

struct FoodApp: View {
  @State var pageNumber = 1
  @State var prevOffsetWidth = (screenWidth + 8) * 2
  @State var offsetWidth = (screenWidth + 8) * 2
  
  var body: some View {
    VStack(alignment: .center) {
      HStack {
        ForEach(heroes, id: \.title) {
          FoodPageView(hero: $0)
        }
      }//.padding(0)
      .offset(x: offsetWidth, y: 0)
      .gesture(DragGesture()
        .onChanged {
          self.offsetWidth = self.prevOffsetWidth + $0.translation.width
        }.onEnded {
          if abs($0.translation.width) < 50 {
            self.offsetWidth = self.prevOffsetWidth
          } else {
            if $0.translation.width > 0 && self.pageNumber > 1 {
              self.prevOffsetWidth += screenWidth + 8
              self.pageNumber -= 1
            } else if $0.translation.width < 0 && self.pageNumber < heroes.count {
              self.prevOffsetWidth -= screenWidth + 8
              self.pageNumber += 1
            }
            self.offsetWidth = self.prevOffsetWidth
          }
        }
      )
      .animation(.interpolatingSpring(stiffness: 100, damping: 10))
      VStack {
        PageIndicator(pageNumber: $pageNumber)
        Button(action: {
        }) {
          Text(pageNumber == 3 ? "开始" : "跳过")
            .foregroundColor(pageNumber == 3 ? .white : .orange)
            .multilineTextAlignment(.trailing)
            .frame(width: screenWidth - 60, height: 50)
            .background(pageNumber == 3 ? Color.orange : Color.white)
            .font(.system(size: 16))
            .cornerRadius(25)
        }
      }.padding(.bottom, 20)
    }
  }
}

struct FoodApp_Previews: PreviewProvider {
  static var previews: some View {
    FoodApp()
  }
}

struct FoodPageView: View {
  var hero: Hero
  
  var body: some View {
    VStack {
      Spacer()
      Image(hero.imageName)
        .resizable()
        .scaledToFit()
        .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 10)
      Text(hero.title)
        .font(.system(size: 36))
        .bold()
        .padding(.top, 70)
      Text(hero.subTitle)
        .multilineTextAlignment(.center)
        .foregroundColor(.gray)
        .padding(.vertical, 20)
      Text(hero.slogan)
        .font(.system(size: 22))
        .foregroundColor(.orange)
      Spacer()
    }.frame(width: screenWidth)
  }
}

struct PageIndicator: View {
  @Binding var pageNumber: Int
  
  var body: some View {
    HStack {
      ForEach(1 ... heroes.count, id: \.self) {
        Circle()
          .frame(width: 10, height: 10)
          .foregroundColor(self.pageNumber == $0 ? .orange : .gray)
      }
    }//.padding(.bottom, 60)
  }
}
