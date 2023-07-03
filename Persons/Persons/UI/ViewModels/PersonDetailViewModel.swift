//
//  PersonDetailViewModel.swift
//  Persons
//
//  Created by Hakan Gül on 02/07/2023.
//

import Foundation

class PersonDetailViewModel : ObservableObject {
    
    
    
    func kisiGuncelle(id: String,name: String, phone: String) {
        print("Adı : \(name) - Tel : \(phone)")
        
    }
}
