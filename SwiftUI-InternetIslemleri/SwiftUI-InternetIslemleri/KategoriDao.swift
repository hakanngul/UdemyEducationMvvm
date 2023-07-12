//
//  KategoriDao.swift
//  SwiftUI-InternetIslemleri
//
//  Created by Hakan Gül on 09/07/2023.
//

import Foundation

class KategorilerDao {
    var localUrl:String
    init() {
        self.localUrl = defaultUrl + "/filmler"
    }
    
    func kategorileriYukle() {
        print("Kategorileri Yükle çalıştı")
        let url = URL(string: "http://kasimadalan.pe.hu/filmler/tum_kategoriler.php")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                let cevap = try JSONDecoder().decode(KategorilerCevap.self, from: data!)
                if let liste = cevap.kategoriler {
                    for kategori in liste {
                        print("----")
                        print("Kategori ID: \(kategori.kategori_id!)")
                        print("Kategori Ad: \(kategori.kategori_ad!)")
                    }
                }
                print("Success: \(cevap.success!)")
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
