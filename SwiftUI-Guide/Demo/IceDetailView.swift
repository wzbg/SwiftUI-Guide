//
//  IceDetailView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/31.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

let customBlack = Color(red: 0.1, green: 0.1, blue: 0.1)
let customGray = Color(red: 0.8, green: 0.8, blue: 0.8)

struct IceDetailView: View {
  @State var iceCream: IceCream
  
  @State var isAnimating = false
  
  var body: some View {
    ZStack(alignment: .top) {
      VStack {
        ZStack(alignment: .top) {
          RoundedRectangle(cornerRadius: 50)
            .foregroundColor(iceCream.bgColor)
            .frame(width: screenWidth, height: 560)
            .padding(.top, -60)
          IceTitleView(iceCream: $iceCream)
            .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.2))
        }
        IceContentView(iceCream: $iceCream)
          .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.6))
        Spacer()
        Button(action: {
        }) {
          Text("购 买")
            .frame(width: screenWidth - 60, height: 50)
            .background(customBlack)
            .cornerRadius(10)
            .foregroundColor(.white)
            .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.8))
        }
        Spacer()
      }
      Image(iceCream.image)
        .resizable()
        .scaledToFit()
        .frame(height: 560)
        .rotationEffect(.degrees(-30))
        .padding(.top, 120)
        .padding(.leading, 50)
        .modifier(LogInAnimationStyle(isAnimating: $isAnimating, delay: 0.4))
    }.navigationBarTitle("")
    .navigationBarHidden(true)
    .onAppear() {
      self.isAnimating = true
    }
  }
}

struct IceDetailView_Previews: PreviewProvider {
  static var previews: some View {
    IceDetailView(iceCream: iceCreams[0])
  }
}

struct IceTitleView: View {
  @Binding var iceCream: IceCream
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      Image(systemName: "arrow.left")
        .scaleEffect(1.5)
        .onTapGesture {
          self.presentationMode.wrappedValue.dismiss()
        }
      Text(iceCream.title)
        .bold()
        .frame(width: screenWidth - 60)
        .font(.system(size: 20))
        .padding(.top, 10)
      Text("30-40分钟送达")
        .frame(width: screenWidth - 60)
        .font(.system(size: 14))
        .foregroundColor(.white)
        .opacity(0.6)
    }.padding(.top, 20)
    .foregroundColor(.white)
  }
}

struct CountButton: View {
  var number: Int
  var isActive: Bool
  
  var body: some View {
    Button(action: {
    }) {
      Text("\(number)")
        .foregroundColor(isActive ? customGray : customBlack)
        .frame(width: 40, height: 40)
    }.background(isActive ? customBlack : customGray)
    .cornerRadius(5)
  }
}

struct IceContentView: View {
  @Binding var iceCream: IceCream
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("自 制")
        .font(.system(size: 24))
        .bold()
      Text("花园草莓是草莓属的广泛杂交种")
        .font(.system(size: 14))
        .foregroundColor(.gray)
        .padding(.top, 5)
        .frame(height: 80)
      Text("库 存")
        .padding(.top, 20)
      HStack {
        CountButton(number: 1, isActive: false)
        CountButton(number: 2, isActive: false)
        CountButton(number: 3, isActive: true)
        CountButton(number: 4, isActive: false)
        CountButton(number: 5, isActive: false)
      }.padding(.vertical, 5)
      Text("合 计：3 * \(String(format: "%.2f", iceCream.price))")
        .font(.system(size: 12))
        .foregroundColor(.gray)
        .padding(.top, 10)
        .padding(.bottom, 15)
    }.padding(EdgeInsets(top: 15, leading: 30, bottom: 0, trailing: 120))
  }
}
