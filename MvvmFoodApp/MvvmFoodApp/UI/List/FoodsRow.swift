//
//  FoodRow.swift
//  MvvmFoodApp
//
//  Created by Hakan Gül on 03/07/2023.
//

import SwiftUI

struct FoodsRow: View {
    var food = Foods()
    var body: some View {
        HStack {
            Image(food.imagePath!).resizable()
                .frame(width: 100, height: 100)
            VStack(alignment: .leading, spacing: 30) {
                Text(food.name!)
                    .font(.headline)
                    .foregroundColor(.secondary)
                Text(food.price!.description + " TL")
                    .font(.headline)
                    .foregroundColor(.blue)
                
            }
        }
    }
}

