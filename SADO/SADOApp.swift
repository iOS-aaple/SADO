//
//  SADOApp.swift
//  SADO
//
//  Created by Aamer Essa on 21/12/2022.
//

import SwiftUI


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
     
      
    return true
  }
}
@main
struct SADOApp: App {
    // register app delegate for Firebase setup
    

    var body: some Scene {
        WindowGroup {
            NavigationView {
              ContentView()
            }
        }
    }
}
