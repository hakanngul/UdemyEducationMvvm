//
//  ContentView.swift
//  Persons
//
//  Created by Hakan Gül on 02/07/2023.
//

import SwiftUI

struct MainPage: View {
    @State private var searchText = ""
    @ObservedObject var viewModel = MainPageViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.personList) { person in
                    NavigationLink(destination:
                                    PersonDetail(personList: $viewModel.personList, person: person)
                    ) {
                        PersonRow(person: person)
                    }
                }.onDelete(perform: viewModel.onDelete)
            }

            .navigationTitle("Kişiler")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: PersonRegister()) {
                        Image(systemName: "plus")
                    }
                }
            }
            .onAppear {
                viewModel.dbCopy()
                viewModel.loadPersons()
            }
        }.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always),
                     prompt: "Kişi Ara").onChange(of: searchText) { res in
            viewModel.search(text: res)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
