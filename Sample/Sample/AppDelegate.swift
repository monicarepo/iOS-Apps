//
//  AppDelegate.swift
//  Sample
//
//  Created by Moni on 02/09/25.
//

import Firebase
import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_: UIApplication,
                     didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
    {
        FirebaseApp.configure()

        return true
    }
}
