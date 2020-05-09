//
//  Item.swift
//  Todoey
//
//  Created by Maryam on 5/3/20.
//  Copyright © 2020 Sofftech. All rights reserved.
//

import Foundation
import RealmSwift

class Item : Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
