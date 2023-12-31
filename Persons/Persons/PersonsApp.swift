//
//  PersonsApp.swift
//  Persons
//
//  Created by Hakan Gül on 02/07/2023.
//

import SwiftUI
import CoreData
@main
struct PersonsApp: App {
    var body: some Scene {
        WindowGroup {
            MainPage()
        }
    }
}

// MARK: - Core Data stack

var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "Model")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    })
    return container
}()

// MARK: Core Saving support

func saveContext(){
    let context = persistentContainer.viewContext
    if context.hasChanges {
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unsolved error \(nserror), \(nserror.userInfo)")
        }
        
    }
}

