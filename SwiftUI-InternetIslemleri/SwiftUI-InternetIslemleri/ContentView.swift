//
//  ContentView.swift
//  SwiftUI-InternetIslemleri
//
//  Created by Hakan Gül on 08/07/2023.
//

import Alamofire
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .onAppear {
//                KisilerDaoAF().kisileriYukle()
//                KisilerDaoAF().kisiKaydet(kisi_ad: "Hakan", kisi_tel: "234234")
//                KisilerDaoAF().kisiGuncelle(kisi_id: "15048", kisi_ad: "Hakanxxx", kisi_tel: "0000")
//                KisilerDaoAF().kisiSil(kisi_id: "15048")
//                KisilerDaoAF().kisiAra(text: "a")
//                KategorilerDaoAF().kategorileriYukle()
                FilmlerDaoAF().filmleriYukle()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

var defaultUrl = "http://kasimadalan.pe.hu"
