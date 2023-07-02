//
//  ContentView.swift
//  MvvmExample1
//
//  Created by Hakan Gül on 02/07/2023.
//

import SwiftUI

struct Anasayfa: View {
    @State private var tfSayi1 = ""
    @State private var tfSayi2 = ""
    @ObservedObject private var viewModel = AnasayfaViewModel()
    
    var body: some View {
        VStack(spacing: 50) {
            Text("\(viewModel.result)").font(.system(size: 50))
            TextField("Sayı 1", text: $tfSayi1).textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Sayı 2", text: $tfSayi2).textFieldStyle(RoundedBorderTextFieldStyle())
            HStack(spacing: 50) {
                Button("Toplama") {
                    viewModel.Topla(s1: tfSayi1, s2: tfSayi2)
                }
                
                Button("Çarpma") {
                    viewModel.Carpma(s1: tfSayi1, s2: tfSayi2)
                }
            
            
            }.disabled(tfSayi1.isEmpty || tfSayi2.isEmpty)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Anasayfa()
    }
}
