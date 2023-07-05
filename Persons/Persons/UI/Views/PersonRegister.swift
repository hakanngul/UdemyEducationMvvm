//
//  PersonRegister.swift
//  Persons
//
//  Created by Hakan Gül on 02/07/2023.
//

import SwiftUI

struct PersonRegister: View {
    @State private var tfPersonName = ""
    @State private var tfPersonPhone = ""
    @Environment(\.presentationMode) var presentationMode
    
    var viewModel = PersonRegisterViewModel()
    
    var body: some View {
        VStack(spacing: 100) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .padding(.top, 30)
            TextField("Name", text: $tfPersonName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Phone", text: $tfPersonPhone)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                viewModel.save(name: tfPersonName, phone: tfPersonPhone)
                presentationMode.wrappedValue.dismiss()
                // show alert
                let alert = UIAlertController(title: "Success", message: "Person saved successfully", preferredStyle: .alert)
                
            }, label: {
                Text("Save")
                    .foregroundColor(.white)
                    .frame(width: 150, height: 30)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 30)
                    .background(Color.blue)
                    .cornerRadius(10)
            
            })
        }
        .navigationTitle("Person Register")
        .padding(30)
    }
}

struct PersonRegister_Previews: PreviewProvider {
    static var previews: some View {
        PersonRegister()
    }
}
