//
//  GenericDao.swift
//  SwiftUI-InternetIslemleri
//
//  Created by Hakan Gül on 09/07/2023.
//

import Foundation
class GenericDao<T: Decodable> {
    var localUrl: String
    
    init() {
        localUrl = defaultUrl
    }
    
    func upload(endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
        let url = URL(string: localUrl + endpoint)!
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data!)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func kaydet(endpoint: String, body: Data, completion: @escaping (Result<T, Error>) -> Void) {
        var request = URLRequest(url: URL(string: localUrl + endpoint)!)
        request.httpMethod = "POST"
        request.httpBody = body
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data!)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}


