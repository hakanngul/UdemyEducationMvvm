//
//  FilmlerDao.swift
//  SwiftUI-InternetIslemleri
//
//  Created by Hakan Gül on 11/07/2023.
//

import Foundation

class FilmlerDao : GenericDao<FilmlerCevap> {
    func uploadMovies() {
        print("Kategorileri Yükle çalıştı")
        let url = URL(string: "http://kasimadalan.pe.hu/filmler/tum_filmler.php")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                let cevap = try JSONDecoder().decode(FilmlerCevap.self, from: data!)
                if let liste = cevap.filmler {
                    for f in liste {
                        print("----")
                        print("Film Id: \(f.film_id!)")
                        print("Film Adı: \(f.film_ad!)")
                        print("Film Yıl: \(f.film_yil!)")
                        print("Film Resim: \(f.film_resim!)")
                        print("Kategori Id: \(f.kategori!.kategori_id!)")
                        print("Kategori Adı: \(f.kategori!.kategori_ad!)")
                        
                    }
                }
                print("Success: \(cevap.success!)")
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}



