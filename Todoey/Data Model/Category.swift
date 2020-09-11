//
//  Category.swift
//  Todoey
//
//  Created by Maryam on 5/3/20.
//  Copyright © 2020 Sofftech. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var color: String = ""
    let items = List<Item>()
}
