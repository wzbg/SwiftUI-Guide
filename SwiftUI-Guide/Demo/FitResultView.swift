//
//  FitResultView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/30.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct FitResultView: View {
  private let bgColor = Color(red: 87/255, green: 67/255, blue: 139/255)
  private let lineChartWidth = screenWidth - 40
  
  @State var isAnimating = false
  
  var body: some View {
    VStack {
      FitTopTitleView()
        .modifier(LogInAnimationStyle(isAnimating: $isAnimating))
      FitListTimeView(bgColor: bgColor)
        .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.2))
      ZStack {
        Rectangle()
          .fill(bgColor)
          .edgesIgnoringSafeArea(.all)
        VStack {
          Spacer()
          Text("统计信息")
            .multilineTextAlignment(.leading)
            .font(.system(size: 24))
            .foregroundColor(.white)
            .frame(width: lineChartWidth)
            .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.4))
          Spacer()
          FitChartView(lineChartWidth: lineChartWidth)
            .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.6))
          Spacer()
          Button(action: {
          }) {
            Text("成 果")
              .frame(width: screenWidth - 80, height: 50)
              .background(LinearGradient(
                gradient: Gradient(colors: [
                  Color(red: 117/255, green: 70/255, blue: 234/255),
                  Color(red: 214/255, green: 61/255, blue: 178/255)
                ]),
                startPoint: .leading,
                endPoint: .trailing
              ))
              .cornerRadius(25)
              .font(.system(size: 25))
              .foregroundColor(.white)
              .shadow(radius: 10)
          }.modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.8))
          Spacer()
        }
      }
    }.navigationBarTitle("")
    .navigationBarHidden(true)
    .onAppear() {
      self.isAnimating = true
    }
  }
}

struct FitResultView_Previews: PreviewProvider {
  static var previews: some View {
    FitResultView()
  }
}

struct FitTopTitleView: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
  var body: some View {
    HStack {
      Button(action: {
        self.presentationMode.wrappedValue.dismiss()
      }) {
        Image(systemName: "chevron.left")
      }
      Spacer()
      Text("健 身")
        .font(.system(size: 20))
        .bold()
      Spacer()
    }.padding(.horizontal, 20)
    .foregroundColor(.black)
  }
}

struct FitSplitterView: View {
  var body: some View {
    Rectangle()
      .fill(Color.black.opacity(0.2))
      .frame(height: 1)
  }
}

struct FitListTimeView: View {
  private let columnWidth = screenWidth * 2 / 3
  var bgColor: Color
  
  var body: some View {
    VStack {
      HStack {
        Text("跑 步")
          .font(.system(size: 20))
          .frame(width: columnWidth, height: 36)
          .foregroundColor(bgColor)
        Button(action: {
        }) {
          ZStack {
            RoundedRectangle(cornerRadius: 20)
              .fill(bgColor)
              .frame(width: 80, height: 36)
            Text("更 多")
              .foregroundColor(.white)
              .font(.system(size: 14))
          }.frame(width: columnWidth / 2, height: 36)
        }
      }
      FitListItemView(
        bgColor: .black,
        columnWidth: columnWidth,
        title: "平均配速",
        value: "7'13''"
      )
      FitListItemView(
        bgColor: .gray,
        columnWidth: columnWidth,
        title: "最慢配速",
        value: "9'50''"
      )
      FitListItemView(
        bgColor: .red,
        columnWidth: columnWidth,
        title: "最快配速",
        value: "5'23''"
      )
      FitListItemView(
        bgColor: .green,
        columnWidth: columnWidth,
        title: "总时长",
        value: "5:24:59"
      )
      FitListItemView(
        bgColor: .blue,
        columnWidth: columnWidth,
        title: "总距离",
        value: "44.96 公里"
      )
      FitListItemView(
        bgColor: .orange,
        columnWidth: columnWidth,
        title: "总消耗",
        value: "3039 千卡"
      )
      FitListItemView(
        bgColor: .yellow,
        columnWidth: columnWidth,
        title: "总步数",
        value: "48656 步"
      )
      FitListItemView(
        bgColor: .pink,
        columnWidth: columnWidth,
        title: "平均步频",
        value: "149 步/分钟"
      )
      FitListItemView(
        bgColor: .purple,
        columnWidth: columnWidth,
        title: "累计爬升",
        value: "129.9 米"
      )
    }
  }
}

struct FitListItemView: View {
  var bgColor: Color
  var columnWidth: CGFloat
  var title: String
  var value: String
  
  var body: some View {
    VStack {
      FitSplitterView()
      HStack {
        Text(title)
          .font(.system(size: 14))
          .foregroundColor(bgColor)
          .frame(width: columnWidth, height: 36)
        Text(value)
          .font(.system(size: 14))
          .foregroundColor(bgColor)
          .frame(width: columnWidth / 2, height: 36)
      }
    }
  }
}

struct FitChartView: View {
  private let barHeights = [160, 200, 170, 150, 130, 100, 140]
  var lineChartWidth: CGFloat
  
  @State var isAnimating = false
  
  var body: some View {
    ZStack(alignment: .bottom) {
      HStack(alignment: .bottom) {
        ForEach(0 ..< 7) {
          Spacer()
          RoundedRectangle(cornerRadius: 10)
            .fill(Color(red: 214/255, green: 61/255, blue: 178/255))
            .frame(
              width: 20,
              height: self.isAnimating ? CGFloat(self.barHeights[$0]) : 0
            )
            .animation(Animation.interpolatingSpring(stiffness: 100, damping: 10)
              .delay(0.9 + 0.1 * Double($0)))
          Spacer()
        }
      }.onAppear() {
        self.isAnimating = true
      }
      Path {
        $0.move(to: CGPoint(x: 0, y: 100))
        $0.addQuadCurve(
          to: CGPoint(x: 130, y: 30), control: CGPoint(x: 60, y: -10)
        )
        $0.addQuadCurve(
          to: CGPoint(x: 230, y: 90), control: CGPoint(x: 180, y: 60)
        )
        $0.addQuadCurve(
          to: CGPoint(x: lineChartWidth, y: 60), control: CGPoint(x: 300, y: 130)
        )
        $0.addLine(to: CGPoint(x: lineChartWidth, y: 200))
        $0.addLine(to: CGPoint(x: 0, y: 200))
        $0.addLine(to: CGPoint(x: 0, y: 100))
      }.fill(Color.white.opacity(0.1))
      .scaleEffect(x: 1, y: self.isAnimating ? 1: 0, anchor: .bottom)
      .animation(Animation.interpolatingSpring(stiffness: 100, damping: 10).delay(0.8))
      Path {
        $0.move(to: CGPoint(x: 0, y: 100))
        $0.addQuadCurve(
          to: CGPoint(x: 130, y: 30), control: CGPoint(x: 60, y: -10)
        )
        $0.addQuadCurve(
          to: CGPoint(x: 230, y: 90), control: CGPoint(x: 180, y: 60)
        )
        $0.addQuadCurve(
          to: CGPoint(x: lineChartWidth, y: 60), control: CGPoint(x: 300, y: 130)
        )
      }.stroke(lineWidth: 2)
      .fill(Color.white)
      .scaleEffect(x: 1, y: self.isAnimating ? 1: 0, anchor: .bottom)
      .animation(Animation.interpolatingSpring(stiffness: 100, damping: 10).delay(0.8))
      ZStack {
        Circle()
          .stroke(lineWidth: 2)
          .frame(width: 20, height: 20)
        Circle()
          .frame(width: 6, height: 6)
      }.foregroundColor(.white)
      .offset(x: -93, y: self.isAnimating ? -170 : 0)
      .animation(Animation.interpolatingSpring(stiffness: 100, damping: 10).delay(0.8))
    }.frame(width: lineChartWidth, height: 200)
  }
}
