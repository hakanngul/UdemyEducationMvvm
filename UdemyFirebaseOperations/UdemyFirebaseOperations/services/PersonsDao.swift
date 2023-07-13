//
//  PersonsDao.swift
//  UdemyFirebaseOperations
//
//  Created by Hakan Gül on 12/07/2023.
//

import Firebase
import Foundation

class PersonsDao {
    var refPersons = Database.database().reference().child("persons")
    
    func save(person: Persons) {
        let newPerson = ["name": person.name!, "age": person.age!] as [String: Any]
        refPersons.childByAutoId().setValue(newPerson)
    }
    
    func readWithGuard() {
        refPersons.observe(.value, with: { snapshot in
            guard let snapShotValue = snapshot.value as? [String: AnyObject] else {
                print("Not found persons")
                return
            }
            
            var persons = [Persons]()
            for (_, personData) in snapShotValue {
                guard let name = personData["name"] as? String,
                      let age = personData["age"] as? Int
                else {
                    continue
                }
                let person = Persons(name: name, age: age)
                persons.append(person)
            }
            
            for p in persons {
                print("\(p.name ?? "") \(p.age ?? 0)")
            }
        })
    }

    func readWithJsonDecoding() {
        refPersons.observe(.value, with: { snapshot in
            guard let snapShotValue = snapshot.value as? [String: AnyObject] else {
                return
            }
            
            var persons = [Persons]()
            for (_, personData) in snapShotValue {
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: personData)
                    let person = try JSONDecoder().decode(Persons.self, from: jsonData)
                    persons.append(person)
                } catch {
                    print("Error decoding person data: \(error)")
                }
            }
            
            for p in persons {
                print("\(p.name ?? "") \(p.age ?? 0)")
            }
        })
    }
    
    func read() {
        refPersons.observe(.value, with: { snapshot in
            var persons = [Persons]()
            
            if let snapShotValue = snapshot.value as? [String: AnyObject] {
                for row in snapShotValue {
                    if let person = row.value as? NSDictionary {
                        persons.append(Persons(name: person["name"] as? String ?? "", age: person["age"] as? Int ?? 0))
                    }
                }
            }
            
            for p in persons {
                print("\(p.name!) \(p.age!)")
            }
            
        })
    }
    
    func delete(key: String) {
        refPersons.child(key).removeValue()
    }
    
    func update(key: String, person: Persons) {
        let updatePerson = ["name": person.name!, "age": person.age!] as [String: Any]
        refPersons.child(key).updateChildValues(updatePerson)
    }
    
    func limited(limit:Int) {
        let query = refPersons.queryLimited(toFirst: UInt(limit))
        printQuery(query: query)
    }
    
    func findAgeRange(first:Int,second:Int) {
        let query = refPersons.queryOrdered(byChild: "age")
            .queryStarting(atValue: first)
            .queryEnding(atValue: second)
        
        printQuery(query: query)
    }
    
    func find(text: String) {
//        let query = refPersons.queryOrdered(byChild: "name").queryEqual(toValue: text)
        let query = refPersons.queryOrdered(byChild: "name").queryStarting(atValue: text).queryEnding(atValue: text + "\u{f8ff}")
        
        printQuery(query: query)
        
    }
    
    private func printQuery(query: DatabaseQuery) {
        query.observe(.value, with: { snapshot in
            var persons = [Persons]()
            
            if let snapShotValue = snapshot.value as? [String: AnyObject] {
                for row in snapShotValue {
                    if let person = row.value as? NSDictionary {
                        persons.append(Persons(name: person["name"] as? String ?? "", age: person["age"] as? Int ?? 0))
                    }
                }
            }
            
            for p in persons {
                print("\(p.name!) \(p.age!)")
            }
            
        })
    }
}
