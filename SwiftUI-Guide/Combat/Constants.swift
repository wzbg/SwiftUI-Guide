//
//  Constants.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/29.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

let regularColor = Color.white.opacity(0.8)
let inactiveColor = Color.white.opacity(0.1)
let activeColor = Color(red: 14/255, green: 172/255, blue: 207/255)

let regularFontSize: CGFloat = 15

let chartWidth = UIScreen.main.bounds.width * 0.6
let menuWidth = UIScreen.main.bounds.width / 4

struct Country: Identifiable {
  var id: Int
  var title: String
  var color: Color
  var visit: Int
}

let countries = [
  Country(id: 1, title: "法国", color: .red, visit: 563),
  Country(id: 2, title: "德国", color: .orange, visit: 234),
  Country(id: 3, title: "意大利", color: .yellow, visit: 522),
  Country(id: 4, title: "美国", color: .green, visit: 1023),
  Country(id: 5, title: "澳大利亚", color: .blue, visit: 421),
  Country(id: 6, title: "南非", color: .purple, visit: 98),
  Country(id: 7, title: "英国", color: .gray, visit: 321),
]
