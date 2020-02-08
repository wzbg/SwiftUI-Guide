//
//  IPAdressView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/8.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct IPAdressSync: View {
  @State var ip = "加载中..."
  
  var body: some View {
    Text(ip)
      .onAppear() {
        let url = URL(string: "http://ip.taobao.com/service/getIpInfo.php?ip=223.74.178.162")
        if let url = url {
          var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
          request.httpMethod = "POST"
          let semaphore = DispatchSemaphore(value: 0)
          let session = URLSession.shared
          let task = session.dataTask(with: request) { data, response, error in
            guard error == nil else {
              self.ip = error.debugDescription
              return
            }
            if let data = data {
              let result = String(data: data, encoding: .utf8)
              DispatchQueue.main.async {
                self.ip = result ?? ""
              }
            }
            semaphore.signal()
          }
          task.resume()
          _ = semaphore.wait(timeout: .distantFuture)
        }
      }
  }
}

struct IPAdressSync_Previews: PreviewProvider {
  static var previews: some View {
    IPAdressSync()
  }
}
