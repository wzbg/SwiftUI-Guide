//
//  ReportsView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/2.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct ReportsView: View {
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
          Text("理财报告")
            .bold()
          Spacer()
          Image(systemName: "calendar")
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        .foregroundColor(.white)
        .font(.system(size: 20))
        .modifier(LogInAnimationStyle(isAnimating: $isAnimating))
        FinanceBarChartView()
          .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.1))
        Rectangle()
          .fill(Color(red: 80/255, green: 90/255, blue: 250/255))
          .frame(height: 2)
          .opacity(0.2)
          .padding(.top, 30)
          .padding(.bottom, 20)
          .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.2))
        VStack {
          Text("支 出")
            .font(.system(size: 18))
            .foregroundColor(.white)
            .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.3))
          FinancePieChartView()
            .padding(.vertical, 10)
            .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.4))
          ScrollView {
            VStack {
              ExpensesRowView(color: .red, title: "购物", price: 1000)
              ExpensesRowView(color: .yellow, title: "KFC", price: 500)
              ExpensesRowView(color: .blue, title: "旅行", price: 250)
              ExpensesRowView(color: .green, title: "杂货", price: 250)
            }.foregroundColor(Color.white.opacity(0.75))
          }.padding(.horizontal, 20)
          .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.5))
        }
        Spacer()
      }
    }.navigationBarTitle("")
    .navigationBarHidden(true)
    .onAppear() {
      self.isAnimating = true
    }
  }
}

struct ReportsView_Previews: PreviewProvider {
  static var previews: some View {
    ReportsView()
  }
}

struct FinanceBarView: View {
  private static let dateFormatte: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM dd"
    return formatter
  }()
  
  var height: Double
  var label: Date
  var best = false
  var havingSpacer = true
  
  @State private var isAnimating = false
  
  var body: some View {
    HStack(alignment: .bottom) {
      VStack {
        Spacer()
        Text("¥ \(decimalFormatter.string(from: NSNumber(value: height))!)")
          .offset(x: 0, y: isAnimating ? 0 : 60)
          .opacity(isAnimating ? 1 : 0)
          .animation(Animation.interpolatingSpring(stiffness: 100, damping: 10)
            .delay(0.5))
        RoundedRectangle(cornerRadius: 6)
          .fill(Color(red: 80/255, green: 90/255, blue: 250/255))
          .opacity(best ? 1 : 0.4)
          .frame(width: 12, height: CGFloat(isAnimating ? height/10 : 0))
          .animation(Animation.interpolatingSpring(stiffness: 100, damping: 10)
            .delay(0.5))
        Text("\(label, formatter: Self.dateFormatte)")
      }.font(.system(size: 11))
      .foregroundColor(best ? .white : .gray)
      if havingSpacer {
        Spacer()
      }
    }.frame(height: CGFloat(height/10))
    .onAppear() {
      self.isAnimating = true
    }
  }
}

struct FinanceBarChartView: View {
  private static let dateFormatte: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM yyyy"
    return formatter
  }()
  
  var body: some View {
    VStack {
      HStack {
        Spacer()
        Image(systemName: "chevron.left")
        Spacer()
        Text("\(Date(), formatter: Self.dateFormatte)")
        Spacer()
        Image(systemName: "chevron.right")
        Spacer()
      }.padding(.bottom, 10)
        .foregroundColor(Color(red: 80/255, green: 90/255, blue: 250/255))
      HStack(alignment: .bottom) {
        FinanceBarView(height: 700, label: Date())
        FinanceBarView(height: 1000, label: Date())
        FinanceBarView(height: 1200, label: Date())
        FinanceBarView(height: 1600, label: Date(), best: true)
        FinanceBarView(height: 600, label: Date())
        FinanceBarView(height: 1100, label: Date(), havingSpacer: false)
      }.padding(EdgeInsets(top: 30, leading: 30, bottom: 0, trailing: 30))
    }
  }
}

struct FinancePieChartView: View {
  var chartColors: [Color] = [.green, .blue, .red, .orange]
  var endPoints: [[CGFloat]] = [[0, 0.125], [0.125, 0.25], [0.25, 0.75], [0.75, 1]]
  
  @State private var isAnimating = false
  
  var body: some View {
    ZStack {
      ForEach(0 ..< 4) { i in
        Circle()
          .trim(
            from: self.isAnimating ? self.endPoints[i][0] : 0,
            to: self.isAnimating ? self.endPoints[i][1] : 0
          )
          .rotation(.degrees(-90))
          .stroke(lineWidth: 14)
          .fill(self.chartColors[i])
          .animation(Animation.interpolatingSpring(stiffness: 100, damping: 10)
            .delay(0.5))
          .frame(width: screenWidth / 3, height: screenWidth / 3)
      }
      VStack {
        Text("消 费")
          .font(.system(size: 14))
        Text("¥ \(decimalFormatter.string(from: NSNumber(value: 2000))!)")
          .bold()
          .font(.system(size: 22))
      }.foregroundColor(Color.white.opacity(0.75))
    }.onAppear() {
      Thread.detachNewThread {
        Thread.sleep(forTimeInterval: 1)
         self.isAnimating = true
      }
    }
  }
}

struct ExpensesRowView: View {
  var color: Color
  var title: String
  var price: Double
  
  var body: some View {
    HStack {
      Circle()
        .fill(color)
        .frame(width: 20, height: 20)
      Text(title)
        .padding(.leading, 12)
      Spacer()
      Text("¥ \(decimalFormatter.string(from: NSNumber(value: price))!)")
    }.font(.system(size: 13))
  }
}
