//
//  UdemyFirebaseOperationsApp.swift
//  UdemyFirebaseOperations
//
//  Created by Hakan Gül on 12/07/2023.
//

import FirebaseCore
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }

//    func application(_ application: UIApplication,
//                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
//    {
//        FirebaseApp.configure()
//
//        return true
//    }
}

@main
struct UdemyFirebaseOperationsApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            NotificationExample()
        }
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .badge])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("Bildirime Tıklandı")
        let app = UIApplication.shared
        if app.applicationState == .active {
            print("Uygulama ön planda")
        } else {
            print("Uygulama arka planda")
        }
        
        app.applicationIconBadgeNumber = 0  
    }
}
