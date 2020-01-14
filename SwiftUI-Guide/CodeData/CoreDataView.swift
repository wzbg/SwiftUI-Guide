//
//  CoreDataView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/14.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI
import CoreData

struct CoreDataView: View {
  var body: some View {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedObjectContext = appDelegate.persistentContainer.viewContext
    let newUser = NSEntityDescription.insertNewObject(
      forEntityName: "User",
      into: managedObjectContext
    ) as! User
    newUser.username = "幻冰"
    newUser.password = "123456"
    var msgs: [String] = []
    do {
      try managedObjectContext.save()
      msgs.append("保存用户信息成功")
    } catch {
      msgs.append("保存用户信息失败")
    }
    
    let userEntity = NSEntityDescription.entity(
      forEntityName: "User",
      in: managedObjectContext
    )
    
    let request = NSFetchRequest<User>(entityName: "User")
    request.fetchOffset = 0
    request.fetchLimit = 10
    request.entity = userEntity
    do {
      request.predicate = NSPredicate(format: "username = '幻冰'", "")
      var items = try managedObjectContext.fetch(request)
      items.forEach {
        msgs.append($0.username ?? "unknown name")
        $0.username = "unrealce"
      }
      try managedObjectContext.save()
      request.predicate = NSPredicate(format: "username = 'unrealce'", "")
      items = try managedObjectContext.fetch(request)
      items.forEach {
        msgs.append($0.username ?? "unknown name")
        managedObjectContext.delete($0)
      }
      try managedObjectContext.save()
      msgs.append("查改删用户信息成功")
    } catch {
      msgs.append("查改删用户信息失败")
    }
    
    return VStack {
      List {
        ForEach(msgs, id: \.self) {
          Text($0)
        }
      }
    }
  }
}

struct CoreDataView_Previews: PreviewProvider {
  static var previews: some View {
    CoreDataView()
  }
}
