//
//  DatabaseConnection.swift
//  Persons
//
//  Created by Hakan Gül on 05/07/2023.
//

import Foundation


class DatabaseConnectionOp {
    
    let db: FMDatabase?
    
    init() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dbPath = URL(fileURLWithPath: path).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: dbPath.path)
    }
    
    
    
    func databaseLoad() {
        let bundle = Bundle.main.path(forResource: "rehber", ofType: ".sqlite")
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dbPath = URL(fileURLWithPath: path).appendingPathComponent("rehber.sqlite")
        let fm = FileManager.default
        if fm.fileExists(atPath: dbPath.path) {
            print("Database has already exist")
        } else {
            do {
                try fm.copyItem(atPath: bundle!, toPath: dbPath.path)
            } catch {
                print("Hata : \(error.localizedDescription)")
            }
        }
    }
    
    func loadPersons() -> [Person] {
        let person = Person()
        var personList = [Person]()
        
        db?.open()
        do {
            let result = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            while result.next() {
                person.id = Int(result.int(forColumn: "kisi_id"))
                person.name = result.string(forColumn: "kisi_ad")
                person.phone = result.string(forColumn: "kisi_tel")
                personList.append(person)
            }
            
        } catch {
            print("Hata : \(error.localizedDescription)")
        }
        db?.close()
        return personList
    }
    
    func savePerson(person: Person) {
        db?.open()
        do {
            try db!.executeUpdate("INSERT INTO kisiler (kisi_ad, kisi_tel) VALUES (?,?)", values: [person.name!, person.phone!])
        } catch {
            print("Hata : \(error.localizedDescription)")
        }
        db?.close()
    }
    
}
