//
//  PersonRegisterViewModel.swift
//  Persons
//
//  Created by Hakan Gül on 02/07/2023.
//

import Foundation

class PersonRegisterViewModel {
    let db: FMDatabase?
    init() {
        let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let path = URL(fileURLWithPath: dbPath).appendingPathComponent("contact.sqlite")
        db = FMDatabase(path: path.path)
    }

    func save(name: String, phone: String) {
        db?.open()
        do {
            try db?.executeUpdate("INSERT INTO kisiler (kisi_ad,kisi_tel) VALUES (?,?)", values: [name, phone])
        } catch {
            print("Hata : \(error.localizedDescription)")
        }
    }
}
