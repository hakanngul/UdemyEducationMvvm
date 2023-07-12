//
//  Kisiler.swift
//  SwiftUI-InternetIslemleri
//
//  Created by Hakan Gül on 08/07/2023.

//

import Foundation

class Kisiler: Codable {
    var kisi_id, kisi_ad, kisi_tel: String?

    init() {}

    init(kisi_id: String, kisi_ad: String, kisi_tel: String) {
        self.kisi_id = kisi_id
        self.kisi_ad = kisi_ad
        self.kisi_tel = kisi_tel
    }
}

class KisilerCevap: Codable {
    var kisiler: [Kisiler]?
    var success: Int?
}
