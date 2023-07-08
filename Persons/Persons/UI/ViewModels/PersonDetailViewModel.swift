//
//  PersonDetailViewModel.swift
//  Persons
//
//  Created by Hakan Gül on 02/07/2023.
//

import Foundation

class PersonDetailViewModel : ObservableObject {
    
    
    let context = persistentContainer.viewContext
    
    
    func kisiGuncelle(person:KisilerModel  ,name:String , phone:String) {
        person.name = name
        person.phone = phone
        saveContext()
    }
}
