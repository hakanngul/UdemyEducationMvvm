//
//  PersonDetailViewModel.swift
//  Persons
//
//  Created by Hakan Gül on 02/07/2023.
//

import Foundation

class PersonDetailViewModel : ObservableObject {
    
    let db: FMDatabase?
    init() {
        let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let path = URL(fileURLWithPath: dbPath).appendingPathComponent("contact.sqlite")
        db = FMDatabase(path: path.path)
    }
    
    
    func kisiGuncelle(id: Int,name: String, phone: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("UPDATE kisiler SET kisi_ad = ?, kisi_tel = ? WHERE kisi_id = ?", values: [name,phone, id])
            
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
}
