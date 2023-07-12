//
//  KisilerDaoAF.swift
//  SwiftUI-InternetIslemleri
//
//  Created by Hakan Gül on 11/07/2023.
//

import Alamofire
import Foundation

class KisilerDaoAF {
    func kisileriYukle2() {
        let url = defaultUrl + "/kisiler/tum_kisiler.php"
        AF.request(url, method: .get).response { response in
            guard let data = response.data else {
                return
            }
            do {
                let res = try JSONDecoder().decode(KisilerCevap.self, from: data)
                guard let list = res.kisiler else {
                    return
                }
                for person in list {
                    print("-----")
                    print("\(person.kisi_id!) \(person.kisi_ad!) - \(person.kisi_tel!)")
                }
                print("Status : \(res.success!)")
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func kisileriYukle() {
        let url = defaultUrl + "/kisiler/tum_kisiler.php"
        AF.request(url, method: .get).response { response in
            if let data = response.data {
                do {
                    let res = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    if let list = res.kisiler {
                        for person in list {
                            print("-----")
                            print("\(person.kisi_id!) \(person.kisi_ad!) - \(person.kisi_tel!)")
                        }
                    }
                    print("Status : \(res.success!)")
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func kisiKaydet(kisi_ad: String, kisi_tel: String) {
        let url = defaultUrl + "/kisiler/insert_kisiler.php"
        let params: Parameters = ["kisi_ad": kisi_ad, "kisi_tel": kisi_tel]
        
        AF.request(url, method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let res = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    print("Kaydedildi : \(res.success!)")
                    print("Mesaj : \(res.message!)")
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }

    func kisiGuncelle(kisi_id: String, kisi_ad: String, kisi_tel: String) {
        let url = defaultUrl + "/kisiler/update_kisiler.php"
        let params: Parameters = ["kisi_id": kisi_id, "kisi_ad": kisi_ad, "kisi_tel": kisi_tel]
        
        AF.request(url, method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let res = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    print("Kaydedildi : \(res.success!)")
                    print("Mesaj : \(res.message!)")
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func kisiSil(kisi_id: String) {
        let url = defaultUrl + "/kisiler/delete_kisiler.php"
        let params: Parameters = ["kisi_id": kisi_id]
        AF.request(url, method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let res = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    print("Silindi : \(res.success!)")
                    print("Mesaj : \(res.message!)")
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func kisiAra(text:String) {
        let url = defaultUrl + "/kisiler/tum_kisiler_arama.php"
        let params: Parameters = ["kisi_ad": text]
        AF.request(url, method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let res = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    if let list = res.kisiler {
                        for person in list {
                            print("\(person.kisi_id!) \(person.kisi_ad!) - \(person.kisi_tel!)")
                            print("-----")
                        }
                    }
                    print("Mesaj : \(res.success!)")
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
