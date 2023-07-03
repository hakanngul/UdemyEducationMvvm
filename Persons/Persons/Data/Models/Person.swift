//
//  Person.swift
//  Persons
//
//  Created by Hakan Gül on 02/07/2023.
//

import Foundation


class Person : Identifiable {
    var id: String = UUID().uuidString
    var name: String?
    var phone: String?
    
    
    init() {
        
    }
    
    init(name: String, phone: String) {
        
        self.name = name
        self.phone = phone
    }

}
