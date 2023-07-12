//
//  FilmlerDaoAF.swift
//  SwiftUI-InternetIslemleri
//
//  Created by Hakan Gül on 11/07/2023.
//

import Alamofire
import Foundation

class FilmlerDaoAF {
    let localUrl: String
    init() {
        localUrl = defaultUrl + "/filmler"
    }

    func filmleriYukle() {
        let url = self.localUrl + "/tum_filmler.php"
        AF.request(url,method: .get).response { response in
            if let data = response.data {
                do {
                    let res = try JSONDecoder().decode(FilmlerCevap.self, from: data)
                    guard let list = res.filmler else {
                        return
                    }
                    for film in list {
                        print("-----")
                        print("\(film.film_id!)")
                        print(film.film_ad!)
                        print(film.film_yil!)
                        print(film.film_resim!)
                        print(film.kategori!.kategori_ad!)
                        print(film.yonetmen!.yonetmen_ad!)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            
            
        }
    }
}
