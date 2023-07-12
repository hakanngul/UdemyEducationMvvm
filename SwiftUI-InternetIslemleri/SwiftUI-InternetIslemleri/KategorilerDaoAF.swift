//
//  KategorilerDaoAF.swift
//  SwiftUI-InternetIslemleri
//
//  Created by Hakan Gül on 11/07/2023.
//

import Foundation
import Alamofire

class KategorilerDaoAF {
    let localUrl: String
    init() {
        localUrl = defaultUrl + "/filmler"
    }
    func kategorileriYukle() {
        let url = self.localUrl + "/tum_kategoriler.php"
        AF.request(url,method: .get).response {response in
            if let data = response.data {
                do {
                    let res = try JSONDecoder().decode(KategorilerCevap.self, from: data)
                    if let list = res.kategoriler {
                        for kategori in list {
                            print("-----")
                            print("\(kategori.kategori_id!) \(kategori.kategori_ad!)")
                        }
                    }
                    print("Status : \(res.success!)")
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
