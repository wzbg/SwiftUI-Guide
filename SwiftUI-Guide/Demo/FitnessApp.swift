//
//  FitnessApp.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/30.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct FitnessApp: View {
  @State var isAnimating = false
  
  var body: some View {
    NavigationView {
      ZStack {
        Rectangle()
          .fill(LinearGradient(
            gradient: Gradient(
              colors: [
                Color(red: 156/255, green: 143/255, blue: 186/255),
                Color(red: 70/255, green: 47/255, blue: 129/255)
              ]),
            startPoint: .top,
            endPoint: .bottom)
          )
          .edgesIgnoringSafeArea(.all)
        VStack {
          FitTitleView()
            .modifier(LogInAnimationStyle(isAnimating: $isAnimating))
          Spacer()
          DonutChartView()
            .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.2))
          Spacer()
          StrengthTodayView()
            .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.4))
          Spacer()
          FitVideosView()
            .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.6))
          Spacer()
        }
      }.navigationBarTitle("")
      .navigationBarHidden(true)
      .onAppear() {
        self.isAnimating = true
      }
    }
  }
}

struct FitnessApp_Previews: PreviewProvider {
  static var previews: some View {
    FitnessApp()
  }
}

struct FitTitleView: View {
  var body: some View {
    HStack {
      Image(systemName: "list.bullet.indent")
      Spacer()
      Text("健 身")
        .font(.system(size: 20))
        .bold()
      Spacer()
      Image(systemName: "magnifyingglass")
    }.padding(.horizontal, 20.0)
    .foregroundColor(.white)
  }
}

struct DonutChartView: View {
  let chartWidth = screenWidth * 0.48
  @State var currentRate: CGFloat = 0.75
  @State var isAnimating = false
  
  var body: some View {
    ZStack {
      Circle()
        .stroke(lineWidth: 8)
        .fill(Color.white)
        .frame(width: chartWidth, height: chartWidth)
      Circle()
        .trim(from: 0, to: isAnimating ? currentRate : 0)
        .stroke(lineWidth: 18)
        .fill(Color.purple)
        .frame(width: chartWidth, height: chartWidth)
        .rotationEffect(.degrees(-90))
      VStack(spacing: 5) {
        Text("3 天")
          .font(.system(size: 36))
        Text("1 周")
          .font(.system(size: 18))
          .opacity(0.6)
      }.padding(.top, 15)
      .foregroundColor(.white)
      .onAppear() {
        Thread.detachNewThread {
          Thread.sleep(forTimeInterval: 0.5)
          self.isAnimating = true
        }
      }
    }
  }
}

struct FitThemeView: View {
  var imageName: String
  var title: String
  
  var body: some View {
    VStack {
      ZStack {
        Circle()
          .fill(Color.white.opacity(0.5))
          .frame(width: 76, height: 76)
        Image(systemName: imageName)
          .scaleEffect(1.6)
          .foregroundColor(.black)
      }
      Text(title)
        .font(.system(size: 14))
        .foregroundColor(.white)
        .opacity(0.8)
    }.padding(.trailing, 10)
  }
}

struct StrengthTodayView: View {
  var body: some View {
    VStack {
      HStack {
        Circle()
          .fill(Color.purple)
          .frame(width: 10, height: 10)
          .padding(.trailing, 10)
        Text("今日力量训练")
          .font(.system(size: 18))
          .foregroundColor(.white)
        Spacer()
      }.padding(.bottom, 5)
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 20) {
          NavigationLink(destination: FitResultView()) {
            FitThemeView(imageName: "hare", title: "模板一")
            FitThemeView(imageName: "scribble", title: "模板二")
            FitThemeView(imageName: "scope", title: "模板三")
            FitThemeView(imageName: "arrow.3.trianglepath", title: "模板四")
            FitThemeView(imageName: "cube", title: "模板五")
          }
        }
      }
    }.padding(.leading, 30)
    .padding(.trailing, 10)
  }
}

struct VideoThumbnail: View {
  var imageName: String
  var title: String
  
  var body: some View {
    VStack {
      ZStack {
        Image(uiImage: UIImage(named: "\(imageName).gif")!)
          .resizable()
          .scaledToFit()
          .frame(height: 90)
          .brightness(-0.2)
          .opacity(0.7)
          .shadow(radius: 5)
          .cornerRadius(10)
        Image(systemName: "arrowtriangle.right.circle")
          .foregroundColor(.white)
          .scaleEffect(2)
      }
      Text(title)
        .font(.system(size: 14))
        .foregroundColor(.white)
        .opacity(0.8)
    }
  }
}

struct FitVideosView: View {
  var body: some View {
    VStack {
      HStack {
        Circle()
          .fill(Color.purple)
          .frame(width: 10, height: 10)
          .padding(.trailing, 10)
        Text("健身视频")
          .font(.system(size: 18))
          .foregroundColor(.white)
        Spacer()
      }.padding(.bottom, 5)
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 20) {
          VideoThumbnail(imageName: "徒手深蹲", title: "徒手深蹲")
          VideoThumbnail(imageName: "俯卧撑", title: "俯卧撑")
          VideoThumbnail(imageName: "平板支撑", title: "平板支撑")
          VideoThumbnail(imageName: "剪蹲", title: "剪蹲")
        }
      }
    }.padding(.leading, 30)
    .padding(.trailing, 10)
  }
}
