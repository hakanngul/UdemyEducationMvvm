//
//  ContentView.swift
//  CoreDataPrcoess
//
//  Created by Hakan Gül on 05/07/2023.
//

import SwiftUI
import CoreData
struct ContentView: View {
    var kisi = Kisiler()
    var body: some View {
        Text("Hello World")
            .onAppear() {
                let dao = KisilerDao()
//                dao.kaydet(kisi_ad: "Hakan", kisi_tel: "123123")
//                dao.kaydet(kisi_ad: "Murat", kisi_tel: "567456")
//                dao.kaydet(kisi_ad: "Çağla", kisi_tel: "484675")
//                dao.kaydet(kisi_ad: "Merve", kisi_tel: "4357567")
//                dao.kaydet(kisi_ad: "Eren", kisi_tel: "345345")
//                dao.tumKisiler()
//                dao.ara(text: "Çağla")
                dao.kontrol(kisiAd: "Çağla")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
