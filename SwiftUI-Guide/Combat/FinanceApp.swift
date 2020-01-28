//
//  FinanceApp.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/28.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct FinanceApp: View {
  @State var isPopup = false
  @State var isAnimating = false
  
  var body: some View {
    ZStack {
      Rectangle()
        .fill(Color(red: 243/155, green: 243/255, blue: 243/255))
        .edgesIgnoringSafeArea(.all)
      VStack {
        TopTitleView()
          .modifier(FinanceAnimationStyle(isAnimating: $isAnimating))
        DepositAmountView()
          .modifier(FinanceAnimationStyle(isAnimating: $isAnimating, delay: 0.2))
        Spacer()
        AtTheTimeView()
          .modifier(FinanceAnimationStyle(isAnimating: $isAnimating, delay: 0.4))
        Spacer()
        InterestPaymentsView()
          .modifier(FinanceAnimationStyle(isAnimating: $isAnimating, delay: 0.6))
        Spacer()
        Button(action: {
          self.isPopup = true
        }) {
          Text("计 算")
            .bold()
            .frame(width: UIScreen.main.bounds.width - 40, height: 60)
            .background(Color.red)
            .cornerRadius(10)
            .foregroundColor(.white)
            .font(.system(size: 18))
        }.offset(x: 0, y: isAnimating ? 0 : 200)
        .animation(Animation.interpolatingSpring(stiffness: 100, damping: 10).delay(1))
        Spacer()
      }.padding(.horizontal, 20)
      .blur(radius: isPopup ? 20 : 0)
      .animation(.spring())
      if isPopup {
        PopupView(isPopup: $isPopup)
      }
    }.onAppear() {
      self.isAnimating = true
    }
  }
}

struct FinanceApp_Previews: PreviewProvider {
  static var previews: some View {
    FinanceApp()
  }
}

struct TopTitleView: View {
  var body: some View {
    HStack {
      Image(systemName: "list.bullet.indent")
      Spacer()
      Text("存款")
        .font(.system(size: 20))
        .bold()
        .padding(.bottom, 15)
        .padding(.top, 10)
      Spacer()
      Image(systemName: "calendar")
    }
  }
}

struct DepositAmountView: View {
  @State var depositAmount = ""
  
  var body: some View {
    ZStack(alignment: .leading) {
      RoundedRectangle(cornerRadius: 20)
        .fill(Color.white)
        .frame(height: UIScreen.main.bounds.height * 0.18)
      VStack(alignment: .leading) {
        Text("存款金额")
          .font(.system(size: 14))
        HStack {
          Image(systemName: "chevron.down")
          // .padding(.trailing, 20)
          Text("¥")
            .bold()
            // .padding(.leading, 20)
            .font(.system(size: 28))
          ZStack {
            RoundedRectangle(cornerRadius: 14)
              .stroke(lineWidth: 1)
              .fill(Color.black.opacity(0.1))
              .frame(height: 70)
            TextField("20,000", text: $depositAmount)
              .padding(.leading, 20)
              .font(.system(size: 24))
          }
        }
      }.padding()
    }
  }
}

struct TimeBoxView: View {
  var title: Int
  var isActive: Bool
  
  private let boxSize = (UIScreen.main.bounds.width - 40 - 15 * 4) / 5
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 15)
        .fill(isActive ? Color.red : Color.white)
        .frame(width: boxSize, height: boxSize)
      Text("\(title)")
        .bold()
        .font(.system(size: 20))
        .foregroundColor(isActive ? Color.white : Color.black)
    }
  }
}

struct AtTheTimeView: View {
  @State var isAnimating = false
  
  var body: some View {
    VStack {
      HStack {
        Text("期限")
        Spacer()
        Text("月")
      }
      HStack(spacing: 15) {
        TimeBoxView(title: 3, isActive: false)
          .animation(Animation.spring().delay(0.4))
        TimeBoxView(title: 6, isActive: false)
          .animation(Animation.spring().delay(0.5))
        TimeBoxView(title: 12, isActive: true)
          .animation(Animation.spring().delay(0.6))
        TimeBoxView(title: 18, isActive: false)
          .animation(Animation.spring().delay(0.7))
        TimeBoxView(title: 24, isActive: false)
          .animation(Animation.spring().delay(0.8))
      }.offset(x: isAnimating ? 0 : UIScreen.main.bounds.width, y : 0)
    }.onAppear() {
      self.isAnimating = true
    }
  }
}

struct DepositsTypeView: View {
  var bgColor: Color
  var percent: String
  var subTitle: SubTitle
  
  private let boxWidth = (UIScreen.main.bounds.width - 40 - 15) / 2
  
  var body: some View {
    ZStack(alignment: .leading) {
      RoundedRectangle(cornerRadius: 20)
        .fill(bgColor)
        .frame(width: boxWidth)
      VStack(alignment: .leading) {
        Image(systemName: subTitle == .Monthly ? "calendar" : "timer")
          .font(.system(size: 40))
          .padding(.bottom, 20)
          .foregroundColor(subTitle == .Monthly ? .black : .white)
        Text(percent)
          .bold()
          .font(.system(size: 24))
        Text(subTitle.rawValue)
          .font(.system(size: 12))
      }
      .foregroundColor(bgColor == .red ? .white : .black)
      .padding(.leading, 20)
    }
  }
}

enum SubTitle: String {
  case AtTheEnd = "一次性支付"
  case Monthly = "每月支付"
}

struct InterestPaymentsView: View {
  @State var isAnimating = false
  
  var body: some View {
    VStack {
      HStack {
        Text("利息")
        Spacer()
      }
      HStack {
        DepositsTypeView(bgColor: .red, percent: "15.50 %", subTitle: .AtTheEnd)
          .offset(x: isAnimating ? 0 : UIScreen.main.bounds.width * -1, y: 0)
          .animation(Animation.spring().delay(0.8))
        DepositsTypeView(bgColor: .white, percent: "14.50 %", subTitle: .Monthly)
          .offset(x: isAnimating ? 0 : UIScreen.main.bounds.width, y: 0)
          .animation(Animation.spring().delay(0.8))
      }.frame(height: UIScreen.main.bounds.height * 0.25)
    }.onAppear() {
      self.isAnimating = true
    }
  }
}

struct PopupView: View {
  @Binding var isPopup: Bool
  
  var body: some View {
    ZStack {
      Rectangle()
        .fill(Color(red: 243/255, green: 243/255, blue: 243/255))
        .edgesIgnoringSafeArea(.all)
        .brightness(-0.9)
        .opacity(isPopup ? 0.6 : 0)
        .animation(.spring())
      ZStack(alignment: .center) {
        RoundedRectangle(cornerRadius: 30)
          .fill(Color.white)
          .frame(height: 500)
        VStack {
          VStack(alignment: .leading) {
            Spacer()
            HStack {
              Spacer()
              Image(systemName: "multiply")
                .font(.system(size: 28))
                .foregroundColor(.gray)
                .onTapGesture {
                  self.isPopup = false
                }
            }.frame(width: UIScreen.main.bounds.width * 0.7)
            Image(systemName: "bitcoinsign.circle")
              .font(.system(size: 48))
              .foregroundColor(.orange)
              .padding(.bottom, 30)
            Text("存款已经提交")
              .font(.system(size: 32))
            Text("感谢您的信任，合同稍后将发送到您的邮箱。 ")
              .font(.system(size: 18))
              .lineSpacing(8)
              .padding(.top, 40)
              .foregroundColor(.gray)
            Button(action: {
              self.isPopup = false
            }) {
              Text("谢 谢")
                .bold()
                .frame(width: UIScreen.main.bounds.width * 0.7, height: 60)
                .background(Color.red)
                .cornerRadius(10)
                .foregroundColor(.white)
                .font(.system(size: 20))
            }.padding(.top, 60)
            Spacer()
          }
          Spacer()
        }.frame(width: UIScreen.main.bounds.width * 0.7)
      }
      .offset(x: 0, y: isPopup ? 0 : UIScreen.main.bounds.height)
      .animation(.spring())
      .padding(20)
    }
  }
}

struct FinanceAnimationStyle: ViewModifier {
  @Binding var isAnimating: Bool
  var delay = 0.0
  
  func body(content: Content) -> some View {
    content
      .opacity(isAnimating ? 1 : 0)
      .animation(Animation.easeOut.delay(delay))
  }
}
