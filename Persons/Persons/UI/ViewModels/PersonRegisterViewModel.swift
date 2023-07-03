//
//  PersonRegisterViewModel.swift
//  Persons
//
//  Created by Hakan Gül on 02/07/2023.
//

import Foundation


class PersonRegisterViewModel : ObservableObject {
    
    
    func save(name:String, phone:String) {
        let person = Person(name: name, phone: phone)
        print("Person saved: \(person.name!) - \(person.phone!)")
    }
    

}

