//
//  Persons.swift
//  UdemyFirebaseOperations
//
//  Created by Hakan Gül on 12/07/2023.
//

import Foundation

class Persons : Codable{
    
    var name: String?
    var age: Int?

    init() {}

  

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
