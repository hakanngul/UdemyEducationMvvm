//
//  MainPageViewModel.swift
//  Persons
//
//  Created by Hakan Gül on 02/07/2023.
//

import Foundation

class MainPageViewModel: ObservableObject {
    @Published var personList = [Person]()
    
    let db: FMDatabase?
    init() {
        let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let path = URL(fileURLWithPath: dbPath).appendingPathComponent("contact.sqlite")
        db = FMDatabase(path: path.path)
    }
    
    func loadPersons() {
        db?.open()
        let sql = "SELECT * FROM kisiler"
        personList.removeAll()
        
        do {
            let rs = try db!.executeQuery(sql, values: nil)
            while rs.next() {
                let person = Person()
                person.id = Int(rs.int(forColumn: "kisi_id"))
                person.name = rs.string(forColumn: "kisi_ad")
                person.phone = rs.string(forColumn: "kisi_tel")
                personList.append(person)
            }
            
        
        } catch {
            print("Hata : \(error.localizedDescription)")
        }
        db?.close()
    }
    
    func dbCopy() {
        let bundle = Bundle.main.path(forResource: "rehber", ofType: ".sqlite")
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dbPath = URL(fileURLWithPath: path).appendingPathComponent("contact.sqlite")
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
    
    func onDelete(at offets: IndexSet) {
        let person = personList[offets.first!]
        // personList.remove(at: offets.first!)
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM kisiler WHERE kisi_id = ?", values: [person.id!])
            loadPersons()
        } catch {
            print("Hata : \(error.localizedDescription)")
        
        }
        db?.close()
        
    }
    
    func search(text: String) {
        db?.open()
        var list = [Person]()
        
        let sql = "SELECT * FROM kisiler WHERE kisi_ad LIKE ?"
        do {
            let rs = try db!.executeQuery(sql, values: ["%\(text)%"])
            while rs.next() {
                let person = Person()
                person.id = Int(rs.int(forColumn: "kisi_id"))
                person.name = rs.string(forColumn: "kisi_ad")
                person.phone = rs.string(forColumn: "kisi_tel")
                list.append(person)
            }
            
            personList = list
        } catch {
            print("Hata : \(error.localizedDescription)")
        }
        db?.close()
    }
}
