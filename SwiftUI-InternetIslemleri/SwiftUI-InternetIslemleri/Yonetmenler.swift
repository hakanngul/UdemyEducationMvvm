//
//  Yonetmenler.swift
//  SwiftUI-InternetIslemleri
//
//  Created by Hakan Gül on 09/07/2023.
//

import Foundation

class Yonetmenler : Codable {
    var yonetmen_id: String?
    var yonetmen_ad: String?
    

    init() {}
    
    init(id: String, ad: String) {
        self.yonetmen_id = id
        self.yonetmen_ad = ad
        
    }
}
