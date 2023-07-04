    //
    //  PersonsDao.swift
    //  UdemyDataBaseProcess
    //
    //  Created by Hakan Gül on 04/07/2023.
    //

import Foundation

class Persons {
    var id:Int?
    var name:String?
    var phone:String?
    
    init(){
        
    }
    
    init(id: Int? = nil, name: String? = nil, phone: String? = nil) {
        self.id = id
        self.name = name
        self.phone = phone
    }
}


class PersonsDao {
    let db: FMDatabase?
    
    init(){
        let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let url = URL(filePath: dbPath).appendingPathComponent("contact.sqlite")
        db = FMDatabase(path: url.path)
    }
    
    
    func deletePerson(id:Int) {
        db?.open()
        do {
            let sql = "DELETE FROM kisiler where kisi_id = ?"
            try db!.executeUpdate(sql, values: [id])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    
    func updatePerson(person:Persons) {
        print("Update Func \(person.id!) - \(person.name!) - \(person.phone!)")
        db?.open()
        do {
            let sql = "UPDATE kisiler SET kisi_ad=?, kisi_tel=? WHERE kisi_id=?"
            try db!.executeUpdate(sql, values: [person.name!, person.phone!, person.id!])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
    func addPerson(person: Persons){
        db?.open()
        do {
            let sql = "INSERT INTO kisiler (kisi_ad, kisi_tel) VALUES (?,?)"
            try db!.executeUpdate(sql, values: [person.name!, person.phone!])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
    func getPersonByName(name:String) {
        db?.open()
        do {
            let person = Persons()
            print(name)
            let sql = "SELECT * FROM kisiler WHERE kisi_ad LIKE '%\(name)%'"
            
            let result = try db!.executeQuery(sql, values: nil)
            while result.next() {
                person.id = Int(result.string(forColumn: "kisi_id"))!
                person.name = result.string(forColumn: "kisi_ad")!
                person.phone = result.string(forColumn: "kisi_tel")!
                
                print("ID: \(person.id!) --  Name: \(person.name!) --  Phone: \(person.phone!)")
            }
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
    func getPersonById(id:Int) {
        db?.open()
        do {
            let person = Persons()
            let sql = "SELECT * FROM kisiler WHERE kisi_id = ?"
            let result = try db!.executeQuery(sql, values: [id])
            while result.next() {
                person.id = Int(result.string(forColumn: "kisi_id"))!
                person.name = result.string(forColumn: "kisi_ad")!
                person.phone = result.string(forColumn: "kisi_tel")!
                
                print("ID: \(person.id!) --  Name: \(person.name!) --  Phone: \(person.phone!)")
            }
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
    func getAllPersons(){
        db?.open()
        do {
            let person = Persons()
            let sql = "SELECT * FROM kisiler"
            let result = try db!.executeQuery(sql, values: nil)
            
            while result.next() {
                person.id = Int(result.string(forColumn: "kisi_id"))!
                person.name = result.string(forColumn: "kisi_ad")!
                person.phone = result.string(forColumn: "kisi_tel")!
                
                print("ID: \(person.id!) --  Name: \(person.name!) --  Phone: \(person.phone!)")
            }
            
            
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func printPerson(res: FMResultSet) {
        let person = Persons()
        
        while res.next() {
            person.id = Int(res.string(forColumn: "kisi_id"))!
            person.name = res.string(forColumn: "kisi_ad")!
            person.phone = res.string(forColumn: "kisi_tel")!
            print("ID: \(person.id!) --  Name: \(person.name!) --  Phone: \(person.phone!)")
        }
    }
    
    
    func getPersonRandomly() {
        db?.open()
        do {
            let sql = "SELECT * FROM kisiler ORDER BY RANDOM() LIMIT 1"
            let result = try db!.executeQuery(sql, values: nil)
            printPerson(res: result)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
}
