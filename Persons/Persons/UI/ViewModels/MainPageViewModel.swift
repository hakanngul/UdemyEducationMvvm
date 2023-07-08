//
//  MainPageViewModel.swift
//  Persons
//
//  Created by Hakan Gül on 02/07/2023.
//

import Foundation
import CoreData

class MainPageViewModel: ObservableObject {
    @Published var personList = [KisilerModel]()
    let context = persistentContainer.viewContext
    
    init() {
        
    }
    
    func loadPersons() {
        personList.removeAll()
        do {
            let liste = try context.fetch(KisilerModel.fetchRequest())
            personList = liste
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func dbCopy() {
        
    }
    
    func onDelete(at offets: IndexSet) {
        let person = personList[offets.first!]
        do {
            context.delete(person)
            saveContext()
            loadPersons()
        }
    }
    
    
    
    
    func search(text: String) {
        if text == "" || text.count < 1 {
            loadPersons()
            return
        }
        do {
            let fr = KisilerModel.fetchRequest() as NSFetchRequest<KisilerModel>
            fr.predicate = NSPredicate(format: "name CONTAINS[c] %@", text)
            personList  = try context.fetch(fr)
            
        } catch {
            print(error.localizedDescription)
        
        }
    }
}
