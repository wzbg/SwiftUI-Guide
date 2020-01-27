//
//  BankCardApp.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/27.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct BankCardApp: View {
  private let activezIndex = 6
  private let bgColors: [Color] = [.blue, .black, .green, .orange, .red, .purple]
  private let cardNos = [
    "5316    5900    0124    0553",
    "6258    0913    5005    8223",
    "6259    5341    8628    4900",
    "5176    3699    1087    2775",
    "6226    8800    6150    9808",
    "4984    5112    0601    1411",
  ]
  @State private var zIndexs = [1, 2, 3, 4, 5, 6]
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      ZStack(alignment: .leading) {
        ForEach(0 ..< 6) { i in
          CardView(
            bgColor: self.bgColors[i],
            cardNo: self.cardNos[i],
            expireDate: Date(),
            userName: "幻冰",
            cardType: i % 2 == 0 ? .VISA : .MASTER
          )
          .scaleEffect(self.zIndexs[i] == self.activezIndex ? 1.05 : 1)
          .rotation3DEffect(
            .degrees(self.zIndexs[i] == self.activezIndex ? 10 : -30),
            axis: (x: 1, y: 0, z: 0)
          )
          .offset(x: 0, y: (CGFloat(self.zIndexs[i]) - 1) * 50)
          .offset(x: 0, y: self.zIndexs[i] == self.activezIndex ? 140 : 0)
          .zIndex(Double(self.zIndexs[i]))
          .animation(.interpolatingSpring(stiffness: 100, damping: 10))
          .onTapGesture {
            self.zIndexs[i] = self.activezIndex
            var temp = 1
            for j in 0 ..< 6 {
              if j == i {
                continue
              }
              self.zIndexs[j] = temp
              temp += 1
            }
          }
        }
//        Spacer()
      }
      .padding(40)
    }
  }
}

struct CardView: View {
  var bgColor: Color
  var cardNo: String
  var expireDate: Date
  var userName: String
  var cardType: CardType
  
  static let dateFormatte: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/yy"
    return formatter
  }()
  
  enum CardType: String {
    case VISA
    case MASTER
  }
  
  func getViewByCardType() -> some View {
    switch cardType {
      case .VISA: return AnyView(ZStack {
        RoundedRectangle(cornerRadius: 10)
          .stroke(lineWidth: 1)
          .fill(Color.white)
          .frame(width: 50, height: 30)
        Text(cardType.rawValue)
          .font(.system(size: 13))
      })
    case .MASTER: return AnyView(HStack(spacing: -10) {
        Circle()
          .fill(Color.red)
          .opacity(0.6)
          .frame(width: 20, height: 20)
        Circle()
          .fill(Color.orange)
          .opacity(0.6)
          .frame(width: 20, height: 20)
      })
    }
  }
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 10)
        .fill(bgColor)
        .shadow(radius: 10)
      VStack {
        HStack {
          Spacer()
          Text(cardType.rawValue)
            .bold()
        }
        ZStack(alignment: .leading) {
          RoundedRectangle(cornerRadius: 5)
            .fill(Color.white).opacity(0.2)
            .frame(height: 45)
          Text(cardNo)
            .font(.system(size: 20))
            .padding(.leading, 20)
        }.padding(.top, 10)
        HStack(alignment: .bottom) {
          VStack(spacing: 5) {
            Text("\(expireDate, formatter: Self.dateFormatte)")
            Text(userName)
          }.font(.system(size: 14))
          Spacer()
          getViewByCardType()
        }.padding(.top, 20)
      }.padding(10)
    }.frame(height: 180)
    .foregroundColor(.white)
  }
}

struct BankCardApp_Previews: PreviewProvider {
  static var previews: some View {
    BankCardApp()
  }
}
