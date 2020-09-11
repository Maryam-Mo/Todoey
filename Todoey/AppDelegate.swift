//
//  AppDelegate.swift
//  Todoey
//
//  Created by Maryam on 5/1/20.
//  Copyright © 2020 Sofftech. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        print (Realm.Configuration.defaultConfiguration.fileURL)
        do {
            _ = try Realm()
        } catch {
            print ("Error initializing new realm, \(error)")
        }
        return true
    }
}

