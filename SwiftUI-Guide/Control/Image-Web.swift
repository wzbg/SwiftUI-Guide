//
//  Image-Web.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/30.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Image_Web: View {
  let placeholderOne = UIImage(named: "avarta3")
  @State private var remoteImage : UIImage? = nil
  @State private var errorMessage : String = ""
  
  var body: some View {
    VStack {
      Image(uiImage: self.remoteImage ?? placeholderOne!)
        .onAppear(perform: fetchRemoteImage)
      Text(errorMessage).padding()
    }
  }
  
  func fetchRemoteImage() {
    guard let url = URL(string: "http://hdjc8.com/images/logo.png") else {
      return
    }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
        self.errorMessage = error.localizedDescription
      } else if let data = data {
        self.remoteImage = UIImage(data: data)
      }
    }.resume()
  }
}

struct Image_Web_Previews: PreviewProvider {
  static var previews: some View {
    Image_Web()
  }
}
