//
//  FoodDetail.swift
//  MvvmFoodApp
//
//  Created by Hakan Gül on 03/07/2023.
//

import SwiftUI

struct FoodsDetailView: View {
    var food = Foods()
    @Environment(\.presentationMode) var pm
    var body: some View {
        VStack(spacing:100) {
            Image(food.imagePath!).resizable()
            VStack(alignment: .leading, spacing: 30) {
                Text(food.name!)
                    .font(.headline)
                    .foregroundColor(.secondary)
                Text(food.price!.description + " TL")
                    .font(.headline)
                    .foregroundColor(.blue)
                Button("Sipariş Ver") {
                    print("Yemek Adı :\(food.name!) Fiyatı : \(food.price!) sipariş verildi")
                    pm.wrappedValue.dismiss()
                }.foregroundColor(.white)
                    .frame(width: 250, height: 50)
                    .background(.blue)
                    .cornerRadius(10)
            }
            
        }.navigationTitle(food.name!.capitalized)
    }
}


struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        FoodsDetailView()
    }
}
