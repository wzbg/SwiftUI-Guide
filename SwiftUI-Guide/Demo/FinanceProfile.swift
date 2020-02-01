//
//  FinanceProfile.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/1.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct FinanceProfile: View {
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
          Text("我的资料")
            .bold()
          Spacer()
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        .foregroundColor(.white)
        .font(.system(size: 20))
        .modifier(LogInAnimationStyle(isAnimating: $isAnimating))
        VStack(spacing: 10) {
          Image(systemName: "person.crop.circle.badge.checkmark")
            .font(.system(size: 64, weight: .light))
            .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.1))
          Text("￠幻冰")
            .bold()
            .font(.system(size: 22))
            .padding(.top, 15)
            .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.2))
          Text("z@uice.xyz")
            .font(.system(size: 14))
            .foregroundColor(.gray)
            .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.3))
        }.padding(.vertical, 30)
        .foregroundColor(.white)
        ScrollView {
          VStack(spacing: 0) {
            FinanceProfileRow(title: "升 级", icon: "person.circle")
            FinanceProfileRow(title: "我的钱包", icon: "alarm")
            FinanceProfileRow(title: "理财报告", icon: "doc.text")
            FinanceProfileRow(title: "账号设置", icon: "gear")
            FinanceProfileRow(title: "退出账号", icon: "alarm")
          }.modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.5))
        }
      }
    }.navigationBarTitle("")
    .navigationBarHidden(true)
    .onAppear() {
      self.isAnimating = true
    }
  }
}

struct FinanceProfile_Previews: PreviewProvider {
  static var previews: some View {
    FinanceProfile()
  }
}

struct FinanceProfileRow: View {
  var title: String
  var icon: String
  
  var body: some View {
    VStack(spacing: 0) {
      HStack(spacing: 20) {
        Image(systemName: icon)
          .foregroundColor(.blue)
          .font(.system(size: 20))
        Text(title)
          .foregroundColor(Color.white.opacity(0.6))
        Spacer()
        if title == "升 级" {
          Button(action: {
          }) {
            ZStack {
              RoundedRectangle(cornerRadius: 5)
                .stroke(lineWidth: 1)
                .fill(Color.orange)
                .frame(width: 70, height: 36)
              Text("更 新")
                .foregroundColor(.orange)
                .font(.system(size: 14))
            }
          }
        } else {
          Image(systemName: "chevron.right")
            .foregroundColor(Color.white.opacity(0.6))
        }
      }.padding(.horizontal, 20)
      .frame(width: screenWidth - 60, height: 70)
      .background(Color.white.opacity(0.05))
      Rectangle()
        .foregroundColor(Color.white.opacity(0.15))
        .frame(width: screenWidth - 60, height: 1)
    }
  }
}
