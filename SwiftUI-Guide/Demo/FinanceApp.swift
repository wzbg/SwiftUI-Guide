//
//  FinanceApp.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/31.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

let dateFormatte: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateFormat = "dd/MM/yyyy"
  return formatter
}()

let decimalFormatter: NumberFormatter = {
  let formatter = NumberFormatter()
  formatter.numberStyle = .decimal
  return formatter
}()

struct FinanceBackground: View {
  var body: some View {
    Rectangle()
      .fill(Color(red: 22/255, green: 46/255, blue: 80/255))
      .edgesIgnoringSafeArea(.all)
  }
}

struct FinanceApp: View {
  @State private var isAnimating = false
  
  var body: some View {
    NavigationView {
      ZStack(alignment: .bottomTrailing) {
        FinanceBackground()
        VStack {
          FinanceTitleView()
            .modifier(LogInAnimationStyle(isAnimating: $isAnimating))
          MyBalanceView()
            .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.2))
          ScrollCardView()
            .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.4))
          TransactionHistoryView()
            .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.6))
        }
        FloatPointView()
          .offset(x: 0, y: isAnimating ? 0 : 160)
          .animation(Animation.interpolatingSpring(stiffness: 100, damping: 10)
            .delay(1))
      }.navigationBarTitle("")
      .navigationBarHidden(true)
      .onAppear() {
        self.isAnimating = true
      }
    }
  }
}

struct FinanceApp_Previews: PreviewProvider {
  static var previews: some View {
    FinanceApp()
  }
}

struct FinanceTitleView: View {
  var body: some View {
    HStack {
      NavigationLink(destination: CategoryGrid()) {
        Image(systemName: "list.bullet")
      }
      Spacer()
      Text("理 财")
      Spacer()
      Image(systemName: "bell")
    }.padding(.horizontal, 20)
      .foregroundColor(.white)
      .font(.system(size: 20))
  }
}

struct MyBalanceView: View {
  private let balance = 2385743.65
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text("余 额")
          .font(.system(size: 14))
          .foregroundColor(.gray)
        Text("¥ \(decimalFormatter.string(from: NSNumber(value: balance))!)")
          .bold()
          .font(.system(size: 20))
      }
      Spacer()
      NavigationLink(destination: FinanceProfile()) {
        Image(systemName: "person.circle")
          .font(.system(size: 20))
      }
    }.padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 20))
      .foregroundColor(.white)
  }
}

struct FinanceCardView: View {
  var cardNo: String
  var person: String
  var color: Color
  var expireDate: Date
  var cardType: CardType
  
  enum CardType: String {
    case VISA
    case MASTER
  }
  
  var body: some View {
    ZStack {
      Rectangle()
        .fill(color)
        .cornerRadius(6)
      VStack(alignment: .leading) {
        Text(cardType.rawValue)
          .bold()
          .italic()
          .font(.system(size: 24))
        Text(cardNo)
          .padding(.top, 10)
          .padding(.bottom, 26)
          .font(.system(size: 20))
        HStack {
          VStack(alignment: .leading, spacing: 5) {
            Text("姓名")
            Text(person)
          }
          Spacer()
          VStack(alignment: .leading, spacing: 5) {
            Text("失效日期")
            Text("\(expireDate, formatter: dateFormatte)")
          }
        }.font(.system(size: 12))
      }.padding(.horizontal, 28)
    }.foregroundColor(.white)
    .frame(width: screenWidth - 76, height: 160)
  }
}

struct ScrollCardView: View {
  @State var pageNumber = 1
  @State var prevOffsetWidth = screenWidth - 80
  @State var offsetWidth = screenWidth - 80
  
  var body: some View {
    VStack {
      HStack(spacing: 0) {
        FinanceCardView(
          cardNo: "****    ****    ****    0553",
          person: "￠幻冰",
          color: Color(red: 81/255, green: 91/255, blue: 251/255),
          expireDate: Date(),
          cardType: .VISA
        ).scaleEffect(pageNumber == 1 ? 1 : 0.9)
        FinanceCardView(
          cardNo: "****    ****    ****    8223",
          person: "幻冰",
          color: .orange,
          expireDate: Date(),
          cardType: .MASTER
        ).scaleEffect(pageNumber == 2 ? 1 : 0.9)
        FinanceCardView(
          cardNo: "****    ****    ****    4900",
          person: "幻冰",
          color: .purple,
          expireDate: Date(),
          cardType: .VISA
        ).scaleEffect(pageNumber == 3 ? 1 : 0.9)
      }.frame(width: screenWidth)
      .padding(.bottom, 10)
      .offset(x: offsetWidth, y: 0)
      .gesture(DragGesture()
        .onChanged {
          self.offsetWidth = self.prevOffsetWidth + $0.translation.width
        }.onEnded {
          if abs($0.translation.width) < 50 {
            self.offsetWidth = self.prevOffsetWidth
          } else {
            if $0.translation.width > 0 && self.pageNumber > 1 {
              self.prevOffsetWidth += screenWidth - 80
              self.pageNumber -= 1
            } else if $0.translation.width < 0 && self.pageNumber < 3 {
              self.prevOffsetWidth -= screenWidth - 80
              self.pageNumber += 1
            }
            self.offsetWidth = self.prevOffsetWidth
          }
        }
      )
      .animation(.interpolatingSpring(stiffness: 100, damping: 10))
      HStack {
        ForEach(1 ... 3, id: \.self) {
          Circle()
            .fill(Color.white)
            .frame(width: 10, height: 10)
            .opacity(self.pageNumber == $0 ? 0.8 : 0.2)
        }
      }.padding(.bottom, 20)
    }
  }
}

struct TransactionRow: View {
  var title: String
  var date: Date
  var price: Double
  
  var body: some View {
    NavigationLink(destination: ReportsView()) {
      HStack {
        VStack(alignment: .leading, spacing: 10) {
          Text(title)
            .font(.system(size: 20))
          Text("\(date, formatter: dateFormatte)")
            .font(.system(size: 14))
            .foregroundColor(.gray)
        }
        Spacer()
        Text("¥ \(decimalFormatter.string(from: NSNumber(value: price))!)")
          .bold()
          .font(.system(size: 20))
          .padding(.trailing, 20)
        Image(systemName: "chevron.right")
          .foregroundColor(Color.gray)
      }.padding()
      .background(Color.white.opacity(0.04))
      .cornerRadius(5)
    }
  }
}

struct TransactionHistoryView: View {
  var body: some View {
    VStack(alignment: .leading) {
      Text("历史交易")
        .font(.system(size: 16))
      ScrollView {
        TransactionRow(title: "房屋贷款", date: Date(), price: 1300000)
        TransactionRow(title: "投资亏损", date: Date(), price: 1510.83)
        TransactionRow(title: "SwiftUI互动教程", date: Date(), price: 50)
        TransactionRow(title: "电影", date: Date(), price: 73.89)
        TransactionRow(title: "电话费", date: Date(), price: 97.8)
        TransactionRow(title: "聚餐", date: Date(), price: 336)
        TransactionRow(title: "鼠年纪念币", date: Date(), price: 200)
        TransactionRow(title: "飞机票", date: Date(), price: 1638.98)
      }
    }.foregroundColor(Color(red: 210/255, green: 210/255, blue: 210/255))
    .padding(.horizontal, 20)
  }
}

struct FloatPointView: View {
  var body: some View {
    NavigationLink(destination: AddIncomeView()) {
      ZStack {
        Circle()
          .fill(Color(red: 81/255, green: 91/255, blue: 251/255))
          .frame(width: 60, height: 60)
        Image(systemName: "plus")
          .font(.system(size: 24))
          .foregroundColor(.white)
      }.padding(.trailing, 20)
      .padding(.bottom, 40)
      .shadow(radius: 10)
    }
  }
}
