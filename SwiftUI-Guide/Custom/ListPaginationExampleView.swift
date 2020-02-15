//
//  ListPaginationExampleView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/15.
//  Copyright © 2020 unrealce. All rights reserved.
//
//  https://www.jianshu.com/p/f1e7411a388a
//  https://www.jianshu.com/p/7005969b5f2e

import SwiftUI

extension Color: Identifiable {
  public var id: Color {
    self
  }
}

extension RandomAccessCollection where Element: Identifiable {
  func isFirst<Item: Identifiable>(_ item: Item) -> Bool {
    guard !isEmpty else {
      return false
    }
    guard let currentIndex = firstIndex(where: {
      AnyHashable($0.id) == AnyHashable(item.id)
    }) else {
      return false
    }
    let distance = self.distance(from: startIndex, to: currentIndex)
    return distance == 0
  }
  
  func isLast<Item: Identifiable>(_ item: Item) -> Bool {
    guard !isEmpty else {
      return false
    }
    guard let currentIndex = lastIndex(where: {
      AnyHashable($0.id) == AnyHashable(item.id)
    }) else {
      return false
    }
    let distance = self.distance(from: currentIndex, to: endIndex)
    return distance == 1
  }
  
  func isThresholdItem<Item: Identifiable>(offset: Int, item: Item) -> Bool {
    guard !isEmpty else {
      return false
    }
    guard let currentIndex = lastIndex(where: {
      AnyHashable($0.id) == AnyHashable(item.id)
    }) else {
      return false
    }
    let distance = self.distance(from: currentIndex, to: endIndex)
    let offset = offset < count ? offset : count - 1
    print("currentIndex: \(currentIndex), endIndex: \(endIndex), distance: \(distance), offset: \(offset)")
    return distance > offset
  }
}

struct ListPaginationExampleView: View {
  @State private var items = [randomColor()]
  @State private var isLoading = false
  private let offset = 10
  
  var body: some View {
    VStack {
//      if isLoading {
//        Text("Loading")
//      }
      List(items) { item in
        Rectangle()
          .foregroundColor(item)
          .onAppear() {
            self.listItemAppears(item)
          }
      }
      if isLoading {
        Text("Loading")
      }
    }
  }
  
  private func listItemAppears<Item: Identifiable>(_ item: Item) {
    guard items.isThresholdItem(offset: offset, item: item) else {
      return
    }
//    guard items.isLast(item) else {
//      return
//    }
    isLoading = true
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.items.append(Self.randomColor())
      self.isLoading = false
    }
  }
  
  private static func randomColor() -> Color {
    Color(red: randomDouble(), green: randomDouble(), blue: randomDouble())
  }
  
  private static func randomDouble() -> Double {
    Double.random(in: 0 ... 1)
  }
}

struct ListPaginationExampleView_Previews: PreviewProvider {
  static var previews: some View {
    ListPaginationExampleView()
  }
}
