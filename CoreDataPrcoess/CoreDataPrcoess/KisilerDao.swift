//
//  KisilerDao.swift
//  CoreDataPrcoess
//
//  Created by Hakan Gül on 05/07/2023.
//

import Foundation
import CoreData
class KisilerDao {
    let context = persistentContainer.viewContext
    
    func kaydet(kisi_ad: String, kisi_tel: String) {
        let kisi = Kisiler(context: context)
        kisi.ad = kisi_ad
        kisi.tel = kisi_tel
        saveContext()
    }
    
    func ara(text: String) {
        do {
            let fetchRequest = Kisiler.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "ad CONTAINS[c] %@", text)
            let list = try context.fetch(fetchRequest)
            for k in list {
                print("---")
                print("Kişi Adı: \(k.ad!) -- Kişi Tel: \(k.tel!)")
            }
        } catch {
            print(error.localizedDescription)
        
        }
    }
    
    func kisiGetir(adi:String) {
        do {
            let fetchRequest = Kisiler.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "ad == %@", adi)
            let list = try context.fetch(fetchRequest)
            for k in list {
                print("---")
                print("Kişi Adı: \(k.ad!) -- Kişi Tel: \(k.tel!)")
            }
        } catch {
            print(error.localizedDescription)
            
        }
    }
    
    func kontrol(kisiAd:String) {
        do {
            let fetchRequest = Kisiler.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "ad == %@", kisiAd)
            let list = try context.fetch(fetchRequest)
            if list.count > 0 {
                print("Kişi var \(list.count)")
            } else {
                print("Kişi yok")
            }
        } catch {
            print(error.localizedDescription)
            
        }
    }
    
    
    func tumKisiler() {
        do {
            let list = try context.fetch(Kisiler.fetchRequest())
            
            for k in list {
                print("------")
                print("Id: \(k.id) -- Kişi Adı: \(k.ad!) -- Kişi Tel: \(k.tel!)")
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
