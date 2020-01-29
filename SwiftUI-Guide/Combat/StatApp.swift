//
//  StatApp.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/29.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct StatApp: View {
  @State var isAnimating = false
  
  var body: some View {
    ZStack {
      Rectangle()
        .fill(LinearGradient(
          gradient: Gradient(
            colors: [
              Color(red: 55/255, green: 67/255, blue: 109/255),
              Color(red: 54/255, green: 98/255, blue: 127/255)
            ]),
          startPoint: .top,
          endPoint: .bottom)
        )
        .edgesIgnoringSafeArea(.all)
      VStack {
        TopBarView()
          .modifier(LogInAnimationStyle(isAnimating: $isAnimating))
        SplitterView()
          .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.2))
        TopMenuView()
          .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.4))
        PieChartView()
          .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.6))
        CountryListView()
          .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.8))
      }
    }.onAppear() {
      self.isAnimating = true
    }
  }
}

struct StatApp_Previews: PreviewProvider {
  static var previews: some View {
    StatApp()
  }
}

struct TopBarView: View {
  var body: some View {
    VStack {
      HStack {
        Image(systemName: "list.bullet.indent")
        Spacer()
        Text("统计")
          .bold()
        Spacer()
        Image(systemName: "magnifyingglass")
      }.padding(.horizontal, 30)
      .foregroundColor(.white)
    }
  }
}

struct SplitterView: View {
  var body: some View {
    Rectangle()
      .fill(inactiveColor)
      .frame(width: screenWidth, height: 1)
  }
}

struct TopMenuView: View {
  @State private var currentIndex = 1
  
  var body: some View {
    VStack {
      HStack {
        MenuItemView(currentIndex: $currentIndex, currentItem: (1, "日"))
        MenuItemView(currentIndex: $currentIndex, currentItem: (2, "周"))
        MenuItemView(currentIndex: $currentIndex, currentItem: (3, "月"))
        MenuItemView(currentIndex: $currentIndex, currentItem: (4, "总"))
      }
      ZStack(alignment: .leading) {
        SplitterView()
        Rectangle()
          .fill(activeColor)
          .frame(width: screenWidth / 4, height: 1)
          .offset(x: menuWidth * CGFloat(currentIndex - 1), y: 0)
          .animation(.spring())
      }
    }
  }
}

struct MenuItemView: View {
  @Binding var currentIndex: Int
  var currentItem: (Int, String)
  
  var body: some View {
    Button(action: {
      self.currentIndex = self.currentItem.0
    }) {
      Text(currentItem.1)
        .font(.system(size: regularFontSize))
        .frame(width: menuWidth, height: 40)
        .foregroundColor(
          currentIndex == currentItem.0 ? activeColor : regularColor
        )
    }
  }
}

struct StatCircleView: View {
  var diameter: CGFloat
  var color: Color
  
  var startPoint: CGFloat
  var endPoint: CGFloat
  
  var angle: Double
  
  @State var isAnimating = false
  
  var body: some View {
    ZStack {
      Circle()
        .stroke(lineWidth: 2)
        .fill(inactiveColor)
        .frame(width: diameter, height: diameter)
      Circle()
        .trim(from: isAnimating ? startPoint : 0, to: isAnimating ? endPoint : 0)
        .stroke(lineWidth: 4)
        .fill(color)
        .frame(width: diameter, height: diameter)
        .rotationEffect(.degrees(isAnimating ? angle : -720))
        .animation(.easeInOut(duration: 3))
    }.onAppear() {
      self.isAnimating = true
    }
  }
}

struct PieChartView: View {
  var body: some View {
    ZStack {
      StatCircleView(
        diameter: chartWidth,
        color: activeColor,
        startPoint: 0,
        endPoint: 0.5,
        angle: -45
      )
      StatCircleView(
        diameter: chartWidth - 40,
        color: .purple,
        startPoint: 0,
        endPoint: 0.4,
        angle: 70
      )
      StatCircleView(
        diameter: chartWidth - 80,
        color: .green,
        startPoint: 0,
        endPoint: 0.3,
        angle: 190
      )
      StatCircleView(
        diameter: chartWidth - 120,
        color: .yellow,
        startPoint: 0,
        endPoint: 0.2,
        angle: 135
      )
      VStack {
        Text("1383")
          .font(.system(size: 32))
          .foregroundColor(.white)
        Text("访问量")
          .font(.system(size: 14))
          .foregroundColor(Color.white.opacity(0.5))
      }
    }.padding(.vertical, 30)
  }
}

struct CountryListView: View {
  @State var isAnimating = false
  
  var body: some View {
    ScrollView {
      VStack {
        ForEach(countries) { country in
          VStack {
            HStack {
              Circle()
                .fill(country.color)
                .frame(width: 10, height: 10)
              Text(country.title)
              Spacer()
              Text("\(country.visit)")
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 10)
            .foregroundColor(.white)
            .modifier(LogInAnimationStyle(
              isAnimating: self.$isAnimating,
              delay: Double(country.id) * 0.2 + 0.8
            ))
            Rectangle()
              .fill(inactiveColor)
              .frame(width: screenWidth - 40, height: 1)
          }
        }
      }
    }.onAppear() {
      self.isAnimating = true
    }
  }
}
