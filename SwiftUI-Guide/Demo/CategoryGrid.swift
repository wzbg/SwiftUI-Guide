//
//  CategoryGrid.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/1.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct CategoryGrid: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @State private var isAnimating = false
  
  var body: some View {
    ZStack {
      FinanceBackground()
      VStack {
        HStack {
          Image(systemName: "chevron.left")
            .onTapGesture {
              self.presentationMode.wrappedValue.dismiss()
            }
          Spacer()
          Text("理财类目")
            .bold()
          Spacer()
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        .foregroundColor(.white)
        .font(.system(size: 20))
        .modifier(LogInAnimationStyle(isAnimating: $isAnimating))
        Rectangle()
          .fill(Color.white.opacity(0.1))
          .frame(height: 1)
          .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.1))
        VStack(spacing: 40) {
          HStack {
            Spacer()
            FinanceBallView(color: .pink, imageName: "flame", title: "餐饮业")
              .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.2))
            Spacer()
            FinanceBallView(color: .yellow, imageName: "car", title: "交通业")
              .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.3))
            Spacer()
            FinanceBallView(color: .blue, imageName: "film", title: "影视业")
              .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.4))
            Spacer()
          }
          HStack {
            Spacer()
            FinanceBallView(color: .green, imageName: "cart", title: "百货业")
              .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.5))
            Spacer()
            FinanceBallView(color: .blue, imageName: "heart", title: "健康业")
              .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.6))
            Spacer()
            FinanceBallView(color: .purple, imageName: "gift", title: "礼品业")
              .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.7))
            Spacer()
          }
          HStack {
            Spacer()
            FinanceBallView(color: .orange, imageName: "person.3", title: "家庭理财")
              .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.8))
            Spacer()
            FinanceBallView(color: .init(.magenta), imageName: "creditcard", title: "银行理财")
              .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.9))
            Spacer()
            FinanceBallView(color: .init(.cyan), imageName: "house", title: "地产业")
              .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 1))
            Spacer()
          }
        }.padding(.top, 30)
        Spacer()
      }
    }.navigationBarTitle("")
    .navigationBarHidden(true)
    .onAppear() {
      self.isAnimating = true
    }
  }
}

struct CategoryGrid_Previews: PreviewProvider {
  static var previews: some View {
    CategoryGrid()
  }
}

struct FinanceBallView: View {
  var color: Color
  var imageName: String
  var title: String
  private let diameter = screenWidth / 6
  
  var body: some View {
    Button(action: {
    }) {
      VStack {
        ZStack {
          Circle()
            .fill(color.opacity(0.15))
            .frame(width: diameter, height: diameter)
          Image(systemName: imageName)
            .foregroundColor(color)
            .font(.system(size: 24))
        }
        Text(title)
          .font(.system(size: 14))
          .foregroundColor(.white)
          .opacity(0.6)
          .padding(.top, 10)
      }
    }
  }
}
