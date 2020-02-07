//
//  FaceDetectionView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/7.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct FaceDetectorView: View {
  private let ciDetector = CIDetector(
    ofType: CIDetectorTypeFace,
    context: CIContext(),
    options: [CIDetectorAccuracy: CIDetectorAccuracyHigh]
  )
  private let image = UIImage(named: "Picture1")!
  @State var features: [CIFeature] = []
  
  var body: some View {
    ZStack(alignment: .topLeading) {
      Image(uiImage: image)
        .onAppear() {
          self.features = []
          if let ciImage = CIImage(image: self.image) {
            if let features = self.ciDetector?.features(in: ciImage) {
              self.features = features
            }
          }
        }
      ForEach(features, id: \.self) {
        Rectangle()
          .stroke(lineWidth: 2)
          .foregroundColor(.white)
          .frame(width: $0.bounds.width, height: $0.bounds.height)
          .offset(x: $0.bounds.minX, y: self.image.size.height - $0.bounds.maxY)
      }
    }
  }
}

struct FaceDetectorView_Previews: PreviewProvider {
  static var previews: some View {
    FaceDetectorView()
  }
}
