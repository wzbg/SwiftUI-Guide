//
//  ScreenShotView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

//extension UIView {
//  var snapshot: UIImage {
//    UIGraphicsImageRenderer(size: bounds.size).image { _ in
//      drawHierarchy(in: bounds, afterScreenUpdates: true)
//    }
//  }
//}

extension View {
  var snapshot: UIImage {
    UIGraphicsImageRenderer(size: UIScreen.main.bounds.size).image { _ in
      UIScreen.main.snapshotView(afterScreenUpdates: true)
        .drawHierarchy(in: UIScreen.main.bounds, afterScreenUpdates: true)
    }
  }
}

struct ScreenshotView: View {
  @State private var image: UIImage?
  
  var body: some View {
    VStack {
      Image("幽恒")
        .resizable()
        .scaledToFit()
      Button("截 屏") {
        self.image = self.snapshot
      }
      if image != nil {
        VStack {
          Text("截屏：\(image!)")
//          Image(uiImage: image!)
        }
      }
    }
  }
}

struct ScreenshotView_Previews: PreviewProvider {
  static var previews: some View {
    ScreenshotView()
  }
}
