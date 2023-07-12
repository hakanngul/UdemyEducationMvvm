//
//  Kategoriler.swift
//  SwiftUI-InternetIslemleri
//
//  Created by Hakan Gül on 08/07/2023.
//

import Foundation

class Kategoriler: Codable {
    var kategori_id: String?
    var kategori_ad: String?

    init() {}

    init(kategori_id: String, kategori_ad: String) {
        self.kategori_id = kategori_id
        self.kategori_ad = kategori_ad
    }
}

class KategorilerCevap: Codable {
    var kategoriler: [Kategoriler]?
    var success: Int?
}
