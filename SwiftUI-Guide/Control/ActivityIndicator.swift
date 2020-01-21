//
//  ActivityIndicator.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/21.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI
import UIKit
import Combine

class GlobalData: ObservableObject {
  @Published var isActive = false
  var cancelableSubscriber: AnyCancellable?
  
  init() {
    cancelableSubscriber = $isActive
      .throttle(for: 3, scheduler: RunLoop.main, latest: true)
      .map { val in false }
      .assign(to: \.isActive, on: self)
  }
}

struct ActivityIndicator: UIViewRepresentable {
  @Binding var isActive: Bool
  
  func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
    UIActivityIndicatorView(style: .large)
  }
  
  func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
    isActive ? uiView.startAnimating() : uiView.stopAnimating()
  }
}

struct LoadingView: View {
  @Binding var isActive: Bool
  
  var body: some View {
    VStack {
      Text("Waiting...")
      ActivityIndicator(isActive: $isActive)
    }
    .frame(
      width: UIScreen.main.bounds.width / 2,
      height: UIScreen.main.bounds.height / 5
    )
    .background(Color.orange)
    .foregroundColor(Color.primary)
    .cornerRadius(20)
    .opacity(isActive ? 1: 0)
  }
}

struct ActivityIndicatorView: View {
  @State var isActive = true
  
  var body: some View {
    LoadingView(isActive: $isActive)
      .onAppear() {
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) {
          self.isActive.toggle()
          $0.invalidate()
        }
      }
  }
}

struct ActivityIndicator_Previews: PreviewProvider {
  static var previews: some View {
    let globalData = GlobalData()
    globalData.isActive = true
    return ActivityIndicatorView().environmentObject(globalData)
  }
}
