//
//  MainPageViewModel.swift
//  Persons
//
//  Created by Hakan Gül on 02/07/2023.
//

import Foundation

class MainPageViewModel: ObservableObject {
    @Published var personList = [Person]()
    
    func loadPersons() {
        var list = [Person]()
        list.append(Person(name: "Hakan", phone: "5317328099"))
        list.append(Person(name: "Ahmet", phone: "4565435345"))
        list.append(Person(name: "Mehmet", phone: "3654764523"))
        list.append(Person(name: "Ali", phone: "765475467"))
        list.append(Person(name: "Veli", phone: "23454657567"))
        list.append(Person(name: "Ayşe", phone: "56754735234"))
        personList = list
    }
    
    func onDelete(at offets: IndexSet) {
        let person = personList[offets.first!]
        personList.remove(at: offets.first!)
        print("Kişi Sil : \(person.id) - \(person.name!)")
    }
    
    func search(text: String) {
        print("Arama Sonucu : \(text)")
    }

}

