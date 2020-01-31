//
//  IceCreamApp.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/31.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct IceCream: Identifiable {
  var id: Int
  var title: String
  var price: Double
  var image: String
  var bgColor: Color
}

let iceCreams = [
  IceCream(
    id: 1,
    title: "芒果味",
    price: 2.99,
    image: "iceCream1",
    bgColor: Color(red: 198/255, green: 141/255, blue: 64/255)
  ),
  IceCream(
    id: 2,
    title: "草莓味",
    price: 3.99,
    image: "iceCream2",
    bgColor: Color(red: 196/255, green: 59/255, blue: 67/255)
  ),
  IceCream(
    id: 3,
    title: "巧克力味",
    price: 4.99,
    image: "iceCream3",
    bgColor: Color(red: 116/255, green: 67/255, blue: 35/255)
  ),
]

struct IceCreamApp: View {
  @State var isAnimating = false
  
  var body: some View {
    NavigationView {
      VStack {
        IceBarView()
          .modifier(LogInAnimationStyle(isAnimating: $isAnimating))
        ZStack {
          ZStack(alignment: .top) {
            SpecialOfferView()
              .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.2))
            IceCardListView()
              .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.4))
          }.padding(.bottom, 10)
        }
        Spacer()
      }.padding(30)
      .navigationBarTitle("")
      .navigationBarHidden(true)
      .onAppear() {
        self.isAnimating = true
      }
    }
  }
}

struct IceCreamApp_Previews: PreviewProvider {
  static var previews: some View {
    IceCreamApp()
  }
}

struct IceBarView: View {
  var body: some View {
    HStack {
      Text("🍦")
        .font(.system(size: 48))
        .padding(.trailing, -10)
      VStack(alignment: .leading, spacing: 5) {
        Text("甜筒")
          .font(.system(size: 18))
        Text("送货上门")
          .font(.system(size: 12))
          .foregroundColor(.gray)
      }
      Spacer()
      Image(systemName: "magnifyingglass")
        .scaleEffect(1.2)
        .foregroundColor(.gray)
    }.padding(.bottom)
  }
}

struct SpecialOfferView: View {
  private let boxSize = screenWidth - 30 * 2
  
  var body: some View {
    ZStack(alignment: .top) {
      RoundedRectangle(cornerRadius: 20)
        .frame(width: boxSize, height: boxSize)
        .foregroundColor(Color(red: 244/255, green: 232/255, blue: 218/255))
      HStack {
        VStack(alignment: .leading) {
          Text("七折优惠")
            .font(.system(size: 18))
          Text("仅限首单用户")
            .font(.system(size: 12))
        }
        Spacer()
        Image(systemName: "checkmark.seal.fill")
          .scaleEffect(1.3)
      }.padding(30)
      .foregroundColor(Color(red: 198/255, green: 141/255, blue: 64/255))
    }
  }
}

struct IceCardView: View {
  private let boxSize = screenWidth - 30 * 2
  var iceCream: IceCream
  
  var body: some View {
    ZStack(alignment: .bottom) {
      RoundedRectangle(cornerRadius: 20)
        .frame(width: boxSize, height: 200)
        .foregroundColor(iceCream.bgColor)
      VStack {
        ZStack(alignment: .bottom) {
          HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
              Text(iceCream.title)
                .font(.system(size: 24))
              Text("自制冰淇淋")
                .font(.system(size: 12))
              Text("¥ \(String(format: "%.2f", iceCream.price))")
                .font(.system(size: 24))
                .padding(.top, 20)
            }.padding(.bottom, 20)
            .foregroundColor(.white)
            Image(iceCream.image)
              .renderingMode(.original)
              .resizable()
              .scaledToFit()
              .frame(height: 200)
              .rotationEffect(.degrees(-45))
              .offset(x: 80, y: 20)
            Spacer()
          }.padding(.horizontal, 30)
        }
      }
    }.padding(.bottom, 10)
  }
}

struct IceCardListView: View {
  @State var isAnimating = false
  
  var body: some View {
    VStack {
      ForEach(iceCreams) { ice in
        NavigationLink(destination: IceDetailView(iceCream: ice)) {
          IceCardView(iceCream : ice)
            .modifier(LogInAnimationStyle(
              isAnimating: self.$isAnimating, delay: 0.2 + 0.2 * Double(ice.id)
            ))
        }
      }
    }.padding(.top, 90)
    .onAppear() {
      self.isAnimating = true
    }
  }
}
