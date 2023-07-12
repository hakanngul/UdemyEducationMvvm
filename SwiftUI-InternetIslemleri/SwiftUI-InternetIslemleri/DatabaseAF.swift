//
//  DatabaseAF.swift
//  SwiftUI-InternetIslemleri
//
//  Created by Hakan Gül on 11/07/2023.
//

import Foundation
import Alamofire

class DatabaseDaoAF {
    func upload<T: Decodable>(responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        let url = defaultUrl + "/kisiler/tum_kisiler.php"
        AF.request(url, method: .get).response { response in
            if let data = response.data {
                do {
                    let res = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(res))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
}
