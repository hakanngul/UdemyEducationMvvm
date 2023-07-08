//
//  PersonDetail.swift
//  Persons
//
//  Created by Hakan Gül on 02/07/2023.
//

import SwiftUI

struct PersonDetail: View {
    @Environment(\.presentationMode) private var presentationMode
    @Binding var personList : [KisilerModel]
    @State private var tfKisiAd = ""
    @State private var tfTel = ""
    
    var person = KisilerModel()
    let width = UIScreen.main.bounds.width
    var viewModel = PersonDetailViewModel()
    
    
    var body: some View {
        VStack(spacing: 80) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(.blue)
                .padding(.top, 30)
            
            TextField("Kişi Ad", text: $tfKisiAd)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(.gray, width: 1)
                .padding()
            TextField("Telefon", text: $tfTel)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(.gray, width: 1)
                .padding()
            
            Button(action: {
                viewModel.kisiGuncelle(person: person,name: tfKisiAd, phone: tfTel)
                self.presentationMode.wrappedValue.dismiss()
                personList.removeAll()
            }) {
                Text("Güncelle")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: width * 0.4, height: 50)
                    .background(Color.blue)
                    .cornerRadius(15)
            }
            
        }.navigationTitle("Kişi Detay")
            .onAppear {
                tfKisiAd = person.name!
                tfTel = person.phone!
            }
    }
}

