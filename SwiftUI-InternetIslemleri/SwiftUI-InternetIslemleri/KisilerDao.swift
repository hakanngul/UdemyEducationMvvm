//
//  KisilerDao.swift
//  SwiftUI-InternetIslemleri
//
//  Created by Hakan Gül on 09/07/2023.
//

import Foundation

class KisilerDao {
    var localUrl:String
    
    init(){
        localUrl  = defaultUrl + "/kisiler"
    }
    
    // get data with urlsession on url
    func kisileriYukle() {
        let url = URL(string: localUrl+"/tum_kisiler.php")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data!)
                if let liste = cevap.kisiler {
                    for kisi in liste {
                        print("----")
                        print("Kisi ID: \(kisi.kisi_id!)")
                        print("Kisi Ad: \(kisi.kisi_ad!)")
                        print("Kisi Tel: \(kisi.kisi_tel!)")
                        
                    }
                    print("Success: \(cevap.success!)")
                }
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func kaydet(kisi_ad:String, kisi_tel:String) {
        var request = URLRequest(url: URL(string: localUrl+"/insert_kisiler.php")!)
        request.httpMethod = "POST"
        let postString = "kisi_ad=\(kisi_ad)&kisi_tel=\(kisi_tel)"
        request.httpBody = postString.data(using: .utf8)
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data!)
                print("----- Kaydet -----")
                print("Success: \(cevap.success!)")
                print("Mesaj: \(cevap.message!)")
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func guncelle(kisi_id:String, kisi_ad:String, kisi_tel:String) {
        var request = URLRequest(url: URL(string: localUrl+"/update_kisiler.php")!)
        request.httpMethod = "POST"
        let postString = "kisi_id=\(kisi_id)&kisi_ad=\(kisi_ad)&kisi_tel=\(kisi_tel)"
        request.httpBody = postString.data(using: .utf8)
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data!)
                print("----- Güncelle -----")
                print("Success: \(cevap.success!)")
                print("Mesaj: \(cevap.message!)")
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func silme(kisi_id:String) {
        var request = URLRequest(url: URL(string: localUrl+"/delete_kisiler.php")!)
        request.httpMethod = "POST"
        let postString = "kisi_id=\(kisi_id)"
        request.httpBody = postString.data(using: .utf8)
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data!)
                print("----- Sil -----")
                print("Success: \(cevap.success!)")
                print("Mesaj: \(cevap.message!)")
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func aramaYap(kisi_ad:String){
        var request = URLRequest(url: URL(string: localUrl+"/tum_kisiler_arama.php")!)
        request.httpMethod = "POST"
        let postString = "kisi_ad=\(kisi_ad)"
        request.httpBody = postString.data(using: .utf8)
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data!)
                if let liste = cevap.kisiler {
                    for kisi in liste {
                        print("----")
                        print("Kisi ID: \(kisi.kisi_id!)")
                        print("Kisi Ad: \(kisi.kisi_ad!)")
                        print("Kisi Tel: \(kisi.kisi_tel!)")
                        
                    }
                    print("Success: \(cevap.success!)")
                }
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
