//
//  AddIncomeView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/1.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct AddIncomeView: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  private let regularColor = Color(red: 210/255, green: 210/255, blue: 210/255)
  
  @State var amountValue = ""
  @State var dateValue = ""
  @State var categoryValue = ""
  
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
          Text("增加收入")
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
        VStack(alignment: .leading, spacing: 20) {
          Text("金额")
            .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.2))
          ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5)
              .stroke(lineWidth: 1)
              .fill(Color.white.opacity(0.1))
              .frame(height: 44)
            if amountValue.isEmpty {
              Text("输入金额")
                .padding(.leading, 10)
                .opacity(0.5)
            }
            TextField("输入金额", text: $amountValue)
              .padding(.leading, 10)
          }.modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.3))
          Text("日期")
            .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.4))
          ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5)
              .stroke(lineWidth: 1)
              .fill(Color.white.opacity(0.1))
              .frame(height: 44)
            if dateValue.isEmpty {
              Text("输入日期")
                .padding(.leading, 10)
                .opacity(0.5)
            }
            TextField("输入日期", text: $dateValue)
              .padding(.leading, 10)
            HStack {
              Spacer()
              Image(systemName: "calendar")
                .padding(.trailing, 20)
                .foregroundColor(.gray)
            }
          }.modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.5))
          Text("类目")
            .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.6))
          ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5)
              .stroke(lineWidth: 1)
              .fill(Color.white.opacity(0.1))
              .frame(height: 44)
            if categoryValue.isEmpty {
              Text("输入类目")
                .padding(.leading, 10)
                .opacity(0.5)
            }
            TextField("输入类目", text: $categoryValue)
              .padding(.leading, 10)
          }.modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.7))
        }.padding(20)
        .foregroundColor(regularColor)
        Spacer()
        Button(action: {
        }) {
          Text("保 存")
            .bold()
            .font(.system(size: 18))
            .frame(width: screenWidth - 60, height: 50)
            .background(Color(red: 81/255, green: 91/255, blue: 251/255))
            .foregroundColor(.white)
            .cornerRadius(5)
        }.modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.8))
        Spacer()
      }
    }.navigationBarTitle("")
    .navigationBarHidden(true)
    .onAppear() {
      self.isAnimating = true
    }
  }
}

struct AddIncomeView_Previews: PreviewProvider {
  static var previews: some View {
    AddIncomeView()
  }
}

