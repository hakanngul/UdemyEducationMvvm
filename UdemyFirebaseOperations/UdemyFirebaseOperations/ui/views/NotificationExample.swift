    //
    //  NotificationExample.swift
    //  UdemyFirebaseOperations
    //
    //  Created by Hakan Gül on 13/07/2023.
    //

import SwiftUI
import UserNotifications

struct NotificationExample: View {
    
    init() {
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert,.badge,.sound]) { success, error in
                guard success else {
                    print("Bildirim izni yok")
                    return
                }
                print("Bildirim izni var")
            }
    }
    
    var body: some View {
        VStack {
                //Modern dizayn Button
            Button {
                makeNotification()
                
            } label: {
                Text("Bildirim izni")
            }
            
            
        }
    }
    
    
    func makeNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Başlık"
        content.subtitle = "Alt Başlık"
        content.body = "İçerik"
        content.badge = 1
        content.sound = .default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        let request = UNNotificationRequest(identifier: "id", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
}

struct NotificationExample_Previews: PreviewProvider {
    static var previews: some View {
        NotificationExample()
    }
}
