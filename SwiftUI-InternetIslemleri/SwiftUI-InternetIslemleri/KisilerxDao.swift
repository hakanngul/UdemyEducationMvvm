//
//  KisilerxDao.swift
//  SwiftUI-InternetIslemleri
//
//  Created by Hakan Gül on 09/07/2023.
//

import Foundation

class KisilerxDao: GenericDao<KisilerCevap> {
    override init() {
        super.init()
        localUrl += "/kisiler"
    }
    
    func uploadPersons() {
        upload(endpoint: "/tum_kisiler.php") { result in
            switch result {
                case .success(let cevap):
                    if let liste = cevap.kisiler {
                        for kisi in liste {
                            print("----")
                            print("Kisi ID: \(kisi.kisi_id!)")
                            print("Kisi Ad: \(kisi.kisi_ad!)")
                            print("Kisi Tel: \(kisi.kisi_tel!)")
                        }
                        print("Success: \(cevap.success!)")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func savePersons(){
        
    }
    
    
}
