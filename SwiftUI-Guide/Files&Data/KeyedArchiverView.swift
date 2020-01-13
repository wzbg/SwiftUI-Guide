//
//  KeyedArchiverView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/13.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

class UserModel2: NSObject, NSCoding {
  var username: String!
  var password: String!

  func encode(with aCoder: NSCoder) {
    aCoder.encode(username, forKey: "username")
    aCoder.encode(password, forKey: "password")
  }

  required init(coder aDeCoder: NSCoder) {
    super.init()
    username = aDeCoder.decodeObject(forKey: "username") as? String
    password = aDeCoder.decodeObject(forKey: "password") as? String
  }
  
  override init() {
  }
}

struct KeyedArchiverView: View {
  var body: some View {
    var savedUser = UserModel2()
    do {
      let user1 = UserModel2()
      user1.username = "unrealce"
      user1.password = "123456"
      let data = NSMutableData()
      let archive = NSKeyedArchiver(forWritingWith: data)
      archive.encode(user1, forKey: "user1Key")
      archive.finishEncoding()
      let filePath = NSHomeDirectory() + "/Documents/contacts.data"
      data.write(toFile: filePath, atomically: true)
      let fileData = NSMutableData(contentsOfFile: filePath)
      let unarchive = try NSKeyedUnarchiver(forReadingFrom: fileData! as Data)
//      savedUser = unarchive.decodeObject(forKey: "user1Key") as! UserModel2
      unarchive.finishDecoding()
    } catch {
    }
    return VStack {
      Text(savedUser.username ?? "unknown username")
      Text(savedUser.password ?? "unknown password")
    }
  }
}

struct KeyedArchiverView_Previews: PreviewProvider {
  static var previews: some View {
    KeyedArchiverView()
  }
}
