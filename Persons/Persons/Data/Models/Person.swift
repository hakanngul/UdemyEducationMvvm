//
//  Person.swift
//  Persons
//
//  Created by Hakan Gül on 02/07/2023.
//

import Foundation


class Person : Identifiable {
    var id: Int?
    var name: String?
    var phone: String?
    
    
    init() {
        
    }
    
    init(id: Int, name: String, phone: String) {
        self.id = id
        self.name = name
        self.phone = phone
    }

}
