//
//  ContentView.swift
//  UdemyDataBaseProcess
//
//  Created by Hakan Gül on 04/07/2023.
//

import SwiftUI

struct Main: View {
    
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        Text("Hello World")
            .onAppear() {
                // viewModel.load()
                // viewModel.addDummyPerson(name: "Test4", phone: "123123")
                // viewModel.updateDatabase(id: 4, name: "Test0", phone: "21312")
                // viewModel.read()
                // viewModel.delete(id: 4)
                // viewModel.getById(id: 1)
                // viewModel.read()
                // viewModel.getByName(name: "T")
                viewModel.getRandom()
            }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
