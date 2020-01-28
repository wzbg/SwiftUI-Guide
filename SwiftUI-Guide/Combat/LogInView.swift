//
//  LogInView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/28.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

enum PageType {
  case signin
  case signup
}

struct LogInView: View {
  @State var pageType: PageType = .signin
  @State var isAnimating = false
  
  var body: some View {
    VStack(alignment: .leading) {
      LogTitleView(pageType: $pageType)
        .modifier(LogInAnimationStyle(isAnimating: $isAnimating))
      LogMenuView(pageType: $pageType)
        .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.2))
      LogFormView(pageType: $pageType)
        .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.4))
      SignInView()
        .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.6))
      Spacer()
      HStack {
        Text(pageType == .signin ? "Don't have an account?" : "Already have an account?")
          .foregroundColor(.gray)
        Text(pageType == .signin ? "Sign Up" : "Sign In")
          .underline()
          .foregroundColor(.orange)
      }.font(.system(size: 14))
      .frame(width: UIScreen.main.bounds.width - 80)
      .padding(.bottom, 20)
      .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.8))
    }.padding(.horizontal, 40)
    .onAppear() {
      self.isAnimating = true
    }
  }
}

struct LogInView_Previews: PreviewProvider {
  static var previews: some View {
    LogInView()
  }
}

struct LogTitleView: View {
  @Binding var pageType: PageType
  
  var body: some View {
    HStack(alignment: .top) {
      Image(systemName: "hand.draw")
        .font(.system(size: 48))
      VStack(alignment: .leading) {
        Text(pageType == .signin ? "Welcome" : "Create")
          .bold()
          .font(.system(size: 26))
        Text(pageType == .signin ? "Back." : "Account.")
          .bold()
          .font(.system(size: 20))
      }.padding(.leading, 5)
      Spacer()
    }.padding(.top, 20)
  }
}

struct LogMenuView: View {
  @Binding var pageType: PageType
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Button(action: {
          withAnimation {
            self.pageType = .signin
          }
        }) {
          Text("SIGNIN")
            .foregroundColor(pageType == .signin ? .orange : .gray)
        }
        Button(action: {
          withAnimation {
            self.pageType = .signup
          }
        }) {
          HStack {
            Text("SIGNUP")
              .padding(.leading, 20)
              .foregroundColor(pageType == .signup ? .orange : .gray)
            Image(systemName: "arrow.right")
              .font(.system(size: 12))
              .foregroundColor(.gray)
          }
        }
      }
      RoundedRectangle(cornerRadius: 2)
        .fill(Color.orange)
        .frame(width: 30, height: 4)
        .offset(x: pageType == .signin ? 0 : 85, y: 0)
        .animation(.spring())
    }.padding(.top, 30)
  }
}

struct LogFormView: View {
  private let distance: CGFloat = 40
  
  @State var email = ""
  @State var password = ""
  @State var number = ""
  
  @Binding var pageType: PageType
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("Email")
      HStack {
        TextField("Email", text: $email)
        Image(systemName: "envelope")
          .foregroundColor(.gray)
      }
      Rectangle()
        .fill(Color.black.opacity(0.2))
        .frame(width: UIScreen.main.bounds.width - distance * 2, height: 1)
      Text("Password")
        .padding(.top, 20)
      HStack {
        TextField("Password", text: $password)
        Image(systemName: "eye.slash")
          .foregroundColor(.gray)
      }
      Rectangle()
        .fill(Color.black.opacity(0.2))
        .frame(width: UIScreen.main.bounds.width - distance * 2, height: 1)
      if pageType == .signup {
        VStack(alignment: .leading) {
          Text("Number")
            .padding(.top, 20)
          HStack {
            TextField("Number", text: $number)
            Image(systemName: "phone")
              .foregroundColor(.gray)
          }
          Rectangle()
            .fill(Color.black.opacity(0.2))
            .frame(width: UIScreen.main.bounds.width - distance * 2, height: 1)
        }
      }
    }.padding(.top, 30)
  }
}

struct SignInView: View {
  var body: some View {
    VStack {
      Text("Forget Password")
        .bold()
        .font(.system(size: 12))
        .foregroundColor(.gray)
      Button(action: {
      }) {
        HStack {
          Text("Login")
            .bold()
          Image(systemName: "arrow.right")
        }
      }.frame(width: UIScreen.main.bounds.width - 40 * 2, height: 44)
        .background(Color.orange)
        .foregroundColor(.white)
        .cornerRadius(22)
      VStack {
        ZStack {
          Rectangle()
            .fill(Color.gray)
            .frame(width: 180, height: 1)
          Text("or")
            .frame(width: 60, height: 20)
            .background(Color.white)
            .foregroundColor(.gray)
        }
        HStack(spacing: 30) {
          Image("Wechat")
            .resizable()
            .frame(width: 48, height: 48)
          Image("Weibo")
            .resizable()
            .frame(width: 80, height: 80)
          Image("QQ")
            .resizable()
            .frame(width: 64, height: 64)
        }.padding(.top, 20)
      }.padding(.top, 20)
    }.padding(.top, 40)
  }
}

struct LogInAnimationStyle: ViewModifier {
  @Binding var isAnimating: Bool
  var delay = 0.0
  
  func body(content: Content) -> some View {
    content
      .opacity(isAnimating ? 1 : 0)
      .animation(Animation.spring().delay(delay))
  }
}
