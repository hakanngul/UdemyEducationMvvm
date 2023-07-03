//
//  ContentView.swift
//  MvvmFoodApp
//
//  Created by Hakan Gül on 03/07/2023.
//

import SwiftUI

struct MainPage: View {
    @ObservedObject var viewModel = MainPageViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.foodsList) {food in
                    NavigationLink(destination: FoodsDetailView(food: food)) {
                        FoodsRow(food: food)
                    }
                }
            }
            .navigationTitle("Foods")
            .navigationBarItems(trailing: Button(action: {
                print("Siparişlerim")
            }, label: {
                Image(systemName: "basket")
                
                    .overlay(
                        Text("5")
                            .foregroundColor(.red)
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .frame(width: 20, height: 20)
                            .border(.gray, width: 1)
                            .background(.clear)
                            .clipShape(Circle())
                            .offset(x: 15, y: -10)
                    )
            }))
            
            
        }.onAppear() {
            viewModel.loadFoods()
            
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
