//
//  AnasayfaViewModel.swift
//  MvvmExample1
//
//  Created by Hakan Gül on 02/07/2023.
//

import Foundation


class AnasayfaViewModel : ObservableObject {
    @Published var result = 0
    
    func Topla(s1: String, s2: String) {
        if let sayi1 = Int(s1), let sayi2 = Int(s2) {
            result = sayi1 + sayi2
        }
    }
    
    func Carpma(s1: String, s2: String) {
        if let sayi1 = Int(s1), let sayi2 = Int(s2) {
            result = sayi1 * sayi2
        }
    }

}
