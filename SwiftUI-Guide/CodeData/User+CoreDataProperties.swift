//
//  User+CoreDataProperties.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/13.
//  Copyright © 2020 unrealce. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var username: String?
    @NSManaged public var password: String?

}
