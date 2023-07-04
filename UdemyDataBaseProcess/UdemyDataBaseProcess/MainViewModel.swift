//
//  MainViewModel.swift
//  UdemyDataBaseProcess
//
//  Created by Hakan Gül on 04/07/2023.
//

import Foundation


class MainViewModel : ObservableObject {
    
    let dao: PersonsDao
    
    init() {
        dao = PersonsDao()
    }
    
    func getRandom() {
        self.dao.getPersonRandomly()
    }
    
    func getByName(name:String) {
        self.dao.getPersonByName(name: name)
    }
    
    
    func getById(id:Int) {
        self.dao.getPersonById(id: id)
    }
    
    func delete(id:Int) {
        self.dao.deletePerson(id: id)
    }
    
    func update(id:Int, name:String, phone:String){
        print("MainViewModel --> \(id) - \(name) - \(phone)")
        self.dao.updatePerson(person: Persons(id: id, name: name, phone: phone))
    }
    
    func read(){
        
        self.dao.getAllPersons()
    }
    
    func add(name:String, phone:String){
        
        self.dao.addPerson(person: Persons(name: name, phone: phone))
    }
    
    func load() {
        let bundle = Bundle.main.path(forResource: "rehber", ofType: "sqlite")
        let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let url = URL(filePath: dbPath).appendingPathComponent("contact.sqlite")
        let fm = FileManager.default
        
        if fm.fileExists(atPath: url.path) {
            print("Database already exists")
        } else {
            do {
                try fm.copyItem(atPath: bundle!, toPath: url.path)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
