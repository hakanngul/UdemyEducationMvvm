//
//  PersonRegisterViewModel.swift
//  Persons
//
//  Created by Hakan Gül on 02/07/2023.
//

import Foundation

class PersonRegisterViewModel {
    let context = persistentContainer.viewContext

    func save(name: String, phone: String) {
        let kisi = KisilerModel(context: context)
        kisi.name = name
        kisi.phone = phone
        saveContext()
    }
}
