//
//  CreateFileView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/13.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct CreateFileView: View {
  var body: some View {
    let filePath = NSHomeDirectory() + "/Documents/swift.txt"
    let info = "Swift 是一种强劲而直观的编程语言，它由 Apple 创造，可用来为 iOS、Mac、Apple TV 和 Apple Watch 开发 app。它旨在为开发者提供充分的自由。Swift 易用并且开源，只要有想法，谁都可以创造非凡。"
    var msgs = ["文件: \(filePath)"]
    do {
      try info.write(toFile: filePath, atomically: true, encoding: .utf8)
      msgs[0] = "创建文件成功: \(filePath)"
    } catch {
      msgs[0] = "创建文件失败: \(filePath)"
    }
    
    let fruits = NSArray(objects: "苹果", "香蕉", "橘子")
    let fruitPath = NSHomeDirectory() + "/Documents/fruitPath.plist"
    fruits.write(toFile: fruitPath, atomically: true)
    msgs.append("创建数组成功: \(fruitPath)")
    
    let products = ["软件": "Xcode", "语言": "Swift"] as NSDictionary
    let productsPath = NSHomeDirectory() + "/Documents/products.plist"
    products.write(toFile: productsPath, atomically: true)
    msgs.append("创建字典成功: \(productsPath)")
    
    let imagePath = NSHomeDirectory() + "/Documents/Pic.png"
    let imageData = UIImage(named: "girlPicture")?.pngData()
    try? imageData?.write(to: URL(fileURLWithPath: imagePath), options: .atomic)
    msgs.append("创建图片成功: \(imagePath)")
    
    return List {
      ForEach(msgs, id: \.self) {
        Text($0)
      }
    }
  }
}

struct CreateFileView_Previews: PreviewProvider {
  static var previews: some View {
    CreateFileView()
  }
}
