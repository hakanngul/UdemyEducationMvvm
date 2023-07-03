//
//  MainPageViewModel.swift
//  MvvmFoodApp
//
//  Created by Hakan Gül on 03/07/2023.
//

import Foundation

class MainPageViewModel : ObservableObject {
    @Published var foodsList = [Foods]()
    
    
    func loadFoods() {
        var list = [Foods]()
        list.append(Foods(id: 1, name: "ayran".capitalized, imagePath: "ayran", price: 8))
        list.append(Foods(id: 2, name: "baklava".capitalized, imagePath: "baklava", price: 70))
        list.append(Foods(id: 3, name: "fanta".capitalized, imagePath: "fanta", price: 10))
        list.append(Foods(id: 4, name: "kadayıf".capitalized, imagePath: "kadayif", price: 50))
        list.append(Foods(id: 5, name: "köfte".capitalized, imagePath: "kofte", price: 60))
        list.append(Foods(id: 6, name: "makarna".capitalized, imagePath: "makarna", price: 55))
        foodsList = list;
    }
    
//    func getFoods() {
//        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood")!
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            do {
//                if let foodsData = data {
//                    let decodedData = try JSONDecoder().decode([Foods].self, from: foodsData)
//                    DispatchQueue.main.async {
//                        self.foods = decodedData
//                    }
//                } else {
//                    print("No data")
//                }
//            } catch {
//                print("Error")
//            }
//        }.resume()
//    }

}
