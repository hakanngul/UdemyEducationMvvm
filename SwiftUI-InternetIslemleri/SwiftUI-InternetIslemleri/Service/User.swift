//
//  User.swift
//  SwiftUI-InternetIslemleri
//
//  Created by Hakan Gül on 11/07/2023.
//

import Foundation

class User : Codable{
    var id: Int
    var name: String?
    var email: String?
    
    init(id: Int, name: String? = nil, email: String? = nil) {
        self.id = id
        self.name = name
        self.email = email
    }
}
