//
//  ContentView.swift
//  UdemyFirebaseOperations
//
//  Created by Hakan Gül on 12/07/2023.
//

import SwiftUI

struct MainApp: View {
    var body: some View {
        Text("Hello, world!")
            .onAppear() {
//                PersonsDao().save(person: Persons(name: "Ezgi", age:29))
//                PersonsDao().save(person: Persons(name: "Şule", age: 26))
//                PersonsDao().save(person: Persons(name: "Neslihan", age: 26))
//                PersonsDao().save(person: Persons(name: "Çağla", age: 26))
//                PersonsDao().read()
//                PersonsDao().delete(key: "-N_AvtOlM1f9Y-bTlT70")
//                PersonsDao().update(person: Persons(key: "-N_ArUzuKGtMHA5iVPTK", name: "Alixx", age: 25))
//                PersonsDao().read()
//                PersonsDao().find(text: "Alix")
//                PersonsDao().findAgeRange(first: 26, second: 28)
                PersonsDao().limited(limit: 2)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainApp()
    }
}
